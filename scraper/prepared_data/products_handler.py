"""Handler for product operations."""

import json
import random
from typing import Dict, List, Any
from prestashop.api import PrestaShopAPIClient
from config import SIZE_CATEGORIES
from convert_to_XML import json_to_xml


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
        product for product in products if product.get('subcategory') in wanted_subcategories
    ]
    return filtered_products


def prepare_product_data(product: Dict[str, Any], category_id_map: Dict[str, int]) -> Dict[str, Any]:
    """Prepare product data for Prestashop format."""
    
    # Extract price (remove currency and convert to netto)
    price_str = product.get('price', '0 zł').replace('zł', '').replace(',', '.').strip()
    try:
        price_brutto = float(price_str)
        price_netto = round(price_brutto / 1.23, 2)  # Remove 23% VAT
    except ValueError:
        price_netto = 0.0
    
    parameters = product.get('parameters', {})
    if 'Waga [g]' in parameters:
        weight = int(parameters['Waga [g]'])
    ean = parameters.get('Kod EAN', '')

    category_name = product.get('category', '')
    subcategory_name = product.get('subcategory', '')
    
    category_id = category_id_map.get(category_name, 2)
    subcategory_id = category_id_map.get(subcategory_name, 2)
    root_id = category_id_map.get('Root', 2)
    
    # Clean description - remove <section> tags
    long_description = product.get('long_description', '')
    short_description = product.get('short_description', '')
    if long_description.startswith('<section'):
        start_pos = long_description.find('>')
        if start_pos != -1:
            long_description = long_description[start_pos + 1:]
        long_description = long_description.replace('</section>', '')

    # Generate link_rewrite (URL-friendly name)
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
    
    prepared_product = {
        "product": {
            "id_category_default": subcategory_id,
            "id_shop_default": 1,
            "weight": weight,
            "price": price_netto,
            "id_tax_rules_group": 1,
            "reference": ean,
            "ean13": ean,
            "name": {
                "language": [
                    {"id": 1, "value": product_name}
                ]
            },
            "link_rewrite": {
                "language": [
                    {"id": 1, "value": link_rewrite}
                ]
            },
            "description": {
                "language": [
                    {"id": 1, "value": long_description}
                ]
            },
            "description_short": {
                "language": [
                    {"id": 1, "value": short_description}
                ]
            },
            "associations": {
                "categories": {
                    "category": [
                        {"id": subcategory_id}
                    ]
                }
            },
            "minimal_quantity": 1,
            "available_for_order": 1,
            "show_price": 1,
            "state": 1,
            "active": 1
        }
    }
    
    return prepared_product


def post_product(prepared_product: Dict[str, Any], api_client: PrestaShopAPIClient) -> int:
    """Post a product to Prestashop and return the product ID."""
    product_name = prepared_product['product']['name']['language'][0]['value']
    
    try:
        xml_data = json_to_xml(prepared_product)
        response = api_client._make_request("POST", "products", data=xml_data)
        product_id = int(response['product']['id'])
        return product_id
    except Exception as e:
        print(f"Error creating product {product_name}: {e}")
        return -1


def set_product_stock(product_id: int, quantity: int, api_client: PrestaShopAPIClient, is_sized: bool) -> bool:
    """Set stock quantity for a product via stock_availables API using CDATA format."""
    try:
        response = api_client._make_request("GET", f"stock_availables?filter[id_product]={product_id}&display=full")
        stock_availables = response.get('stock_availables', [])
        if not stock_availables:
            print(f"No stock_available found for product ID {product_id}")
            return False
        stock_id = int(stock_availables[0]['id'])        
        
        xml_data = f""" <?xml version="1.0" encoding="UTF-8"?>
                        <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
                            <stock_availables>
                                <stock_available>
                                    <id>
                                        <![CDATA[{stock_id}]]>
                                    </id>
                                    <id_product xlink:href="http://localhost:8080/api/products/{product_id}">
                                        <![CDATA[{product_id}]]>
                                    </id_product>
                                    <id_product_attribute>
                                        <![CDATA[0]]>
                                    </id_product_attribute>
                                    <id_shop xlink:href="http://localhost:8080/api/shops/1">
                                        <![CDATA[1]]>
                                    </id_shop>
                                    <id_shop_group>
                                        <![CDATA[0]]>
                                    </id_shop_group>
                                    <quantity>
                                        <![CDATA[{0 if is_sized else quantity}]]>
                                    </quantity>
                                    <depends_on_stock>
                                        <![CDATA[{1 if is_sized else 0}]]>
                                    </depends_on_stock>
                                    <out_of_stock>
                                        <![CDATA[2]]>
                                    </out_of_stock>
                                    <location>
                                        <![CDATA[]]>
                                    </location>
                                </stock_available>
                            </stock_availables>
                        </prestashop>"""

        api_client._make_request("PUT", f"stock_availables/{stock_id}", data=xml_data)
        return True
    except Exception as e:
        print(f"Error setting stock for product {product_id}: {e}")
        return False
