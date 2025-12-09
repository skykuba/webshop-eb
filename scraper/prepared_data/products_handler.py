"""Handler for product operations."""

import json
import sys
import os
from typing import Dict, List, Any

# Add parent directories to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from prestashop.api import PrestaShopAPIClient


def load_products(products_file: str) -> List[Dict[str, Any]]:
    """Load products from a JSON file."""
    with open(products_file, 'r', encoding='utf-8') as f:
        products: List[Dict[str, Any]] = json.load(f)
    return products


def save_prepared_data(prepared_products: List[Dict[str, Any]], output_data_file: str) -> None:
    """Save prepared product data to a JSON file."""
    with open(output_data_file, 'w', encoding='utf-8') as f:
        json.dump(prepared_products, f, ensure_ascii=False, indent=2)


def filter_products(products: List[Dict[str, Any]], wanted_subcategories: List[str]) -> List[Dict[str, Any]]:
    """Filter products based on wanted subcategories."""
    filtered_products: List[Dict[str, Any]] = [
        product for product in products 
        if product.get('subcategory') in wanted_subcategories 
        and len(product.get('photos', [])) >= 2
    ]
    return filtered_products


def prepare_product_data(product: Dict[str, Any], category_id_map: Dict[str, int]) -> str:
    """Prepare product data for Prestashop format."""
    
    # Extract price
    price_str = product.get('price', '0 zł').replace('zł', '').replace(',', '.').replace(' ', '').replace('-', '').replace('\n', '').replace('\t', '').strip()
    try:
        price_brutto = float(price_str)
        price_netto = round(price_brutto / 1.23, 2)  # Remove 23% VAT
    except ValueError:
        price_netto = 0.0
    
    parameters = product.get('parameters', {})
    weight = 0
    if 'Waga [g]' in parameters:
        weight_str = str(parameters['Waga [g]'])
        import re
        weight_match = re.search(r'(\d+(?:\.\d+)?)', weight_str)
        if weight_match:
            weight = float(weight_match.group(1))
        else:
            weight = 0

    subcategory_name = product.get('subcategory', '')
    
    subcategory_id = category_id_map.get(subcategory_name, 2)
    
    import re
    
    def clean_html(html_content: str) -> str:
        """Remove all attributes from HTML tags, keep only tag names and content."""
        if not html_content:
            return ''
        
        # Remove <section> tags
        if html_content.startswith('<section'):
            start_pos = html_content.find('>')
            if start_pos != -1:
                html_content = html_content[start_pos + 1:]
        html_content = html_content.replace('</section>', '')
        
        # Remove entire <div class="video-container">...</div> blocks
        html_content = re.sub(r'<div[^>]*video-container[^>]*>.*?</div>', '', html_content, flags=re.DOTALL | re.IGNORECASE)
        
        # Remove iframe tags
        html_content = re.sub(r'<iframe[^>]*>.*?</iframe>', '', html_content, flags=re.DOTALL | re.IGNORECASE)
        
        # Remove script tags
        html_content = re.sub(r'<script[^>]*>.*?</script>', '', html_content, flags=re.DOTALL | re.IGNORECASE)
        
        # Remove all attributes from HTML tags (class="...", style="...", etc.)
        # Pattern: <tag attr="value" attr2='value'> -> <tag>
        html_content = re.sub(r'<(\w+)[^>]*>', r'<\1>', html_content)
        
        # Escape CDATA end markers
        html_content = html_content.replace(']]>', ']]&gt;')
        
        return html_content
    
    long_description = clean_html(product.get('long_description', ''))
    short_description = clean_html(product.get('short_description', ''))

    # Generate link_rewrite
    product_name = product.get('name', '')
    link_rewrite = (product_name.lower()
                    .replace(' ', '-')
                    .replace(',', '')
                    .replace('/', '-')
                    .replace('(', '')
                    .replace(')', '')
                    .replace('ą', 'a').replace('ć', 'c').replace('ę', 'e')
                    .replace('ł', 'l').replace('ń', 'n').replace('ó', 'o')
                    .replace('ś', 's').replace('ź', 'z').replace('ż', 'z')
                    .replace('--', '-')
                    .strip('-'))
    xml_data = f''' <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
                        <product>
                            <id_category_default><![CDATA[{subcategory_id}]]></id_category_default>
                            <id_shop_default><![CDATA[1]]></id_shop_default>
                            <weight><![CDATA[{weight}]]></weight>
                            <price><![CDATA[{price_netto}]]></price>
                            <id_tax_rules_group><![CDATA[1]]></id_tax_rules_group>
                            <name>
                                <language id="1"><![CDATA[{product_name}]]></language>
                            </name>
                            <description>
                                <language id="1"><![CDATA[{long_description}]]></language>
                            </description>
                            <description_short>
                                <language id="1"><![CDATA[{short_description}]]></language>
                            </description_short>
                            <link_rewrite>
                                <language id="1"><![CDATA[{link_rewrite}]]></language>
                            </link_rewrite>
                            <meta_title>
                                <language id="1"><![CDATA[{product_name}]]></language>
                            </meta_title>
                            <meta_description>
                                <language id="1"><![CDATA[{short_description}]]></language>
                            </meta_description>
                            <associations>
                            <categories>
                                <category>
                                <id><![CDATA[{subcategory_id}]]></id>
                                </category>
                            </categories>
                            </associations>
                            <minimal_quantity><![CDATA[1]]></minimal_quantity>
                            <additional_delivery_times><![CDATA[1]]></additional_delivery_times>
                            <available_for_order><![CDATA[1]]></available_for_order>
                            <show_price><![CDATA[1]]></show_price>
                            <state><![CDATA[1]]></state>
                            <active><![CDATA[1]]></active>
                        </product>
                    </prestashop>'''
    return xml_data


def post_product(prepared_product: str, api_client: PrestaShopAPIClient) -> int:
    """Post a product to Prestashop and return the product ID."""
    try:
        response = api_client._make_request("POST", "products", data=prepared_product)
        
        if 'product' in response and 'id' in response['product']:
            product_id = int(response['product']['id'])
            print(f"Created product (ID: {product_id})")
            return product_id
        else:
            print(f"Error: No product ID in response")
            return -1
            
    except Exception as e:
        error_msg = str(e)
        print(f"Error creating product: {error_msg}")
        return -1


def set_product_stock(product_id: int, quantity: int, api_client: PrestaShopAPIClient, is_sized: bool = False) -> bool:
    """
    Set stock quantity for a product via stock_availables API.
    
    Note: This should ONLY be called for products WITHOUT combinations.
    For products with combinations (sizes), stock is set per combination.
    """
    try:
        response = api_client._make_request("GET", f"stock_availables?filter[id_product]={product_id}&filter[id_product_attribute]=0&display=full")
        
        if isinstance(response, dict):
            stock_availables = response.get('stock_availables', [])
        else:
            stock_availables = response
            
        if not stock_availables:
            print(f"No stock_available found for product {product_id}")
            return False
        
        stock_id = int(stock_availables[0]['id'])
        
        # Set stock quantity for product without combinations
        xml_data = f"""<?xml version="1.0" encoding="UTF-8"?>
<prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
    <stock_available>
        <id><![CDATA[{stock_id}]]></id>
        <id_product><![CDATA[{product_id}]]></id_product>
        <id_product_attribute><![CDATA[0]]></id_product_attribute>
        <id_shop><![CDATA[1]]></id_shop>
        <quantity><![CDATA[{quantity}]]></quantity>
        <depends_on_stock><![CDATA[0]]></depends_on_stock>
        <out_of_stock><![CDATA[2]]></out_of_stock>
    </stock_available>
</prestashop>"""
        
        api_client._make_request("PUT", f"stock_availables/{stock_id}", data=xml_data)
        print(f"Set stock for product {product_id}: {quantity} units")
        return True
    except Exception as e:
        print(f"Error setting stock for product {product_id}: {e}")
        return False