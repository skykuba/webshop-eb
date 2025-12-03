"""Handler for product operations."""

import json
from typing import Dict, List, Any
from prestashop.api import PrestaShopAPIClient
from config import SIZE_CATEGORIES


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
    
    # Get category IDs
    category_name = product.get('category', '')
    subcategory_name = product.get('subcategory', '')
    
    category_id = category_id_map.get(category_name, 2)
    subcategory_id = category_id_map.get(subcategory_name, 2)
    root_id = category_id_map.get('Root', 2)
    
    # Check if product is sized
    is_sized = category_name.lower() in SIZE_CATEGORIES
    
    # Clean description - remove <section> tags
    long_description = product.get('long_description', '')
    if long_description.startswith('<section'):
        start_pos = long_description.find('>')
        if start_pos != -1:
            long_description = long_description[start_pos + 1:]
        long_description = long_description.replace('</section>', '')
    
    prepared_product = {
        "product": {
            "active": 1,
            "id_category_default": subcategory_id,
            "price": price_netto,
            "reference": product.get('parameters', {}).get('Kod EAN', ''),
            "ean13": product.get('parameters', {}).get('Kod EAN', ''),
            "name": {
                "language": {
                    "id": 1,
                    "value": product.get('name', '')
                }
            },
            "description": {
                "language": {
                    "id": 1,
                    "value": long_description
                }
            },
            "description_short": {
                "language": {
                    "id": 1,
                    "value": product.get('short_description', '')
                }
            },
            "minimal_quantity": 1,
            "id_tax_rules_group": 1,
            "depends_on_stock": 1 if is_sized else 0,
            "out_of_stock": 0,  # 0 - deny orders when out of stock
            "associations": {
                "categories": [
                    {"id": root_id},
                    {"id": category_id},
                    {"id": subcategory_id}
                ]
            }
        }
    }
    
    # Add quantity only for non-sized products
    if not is_sized:
        prepared_product["product"]["quantity"] = 1
    
    return prepared_product


def post_product(prepared_product: Dict[str, Any], api_client: PrestaShopAPIClient) -> int:
    """Post a product to Prestashop and return the product ID."""
    # TODO: Implement product posting
    pass
