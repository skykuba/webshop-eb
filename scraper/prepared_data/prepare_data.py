# TODO POST used categories to prestashop to get category ids
# TODO take choosen products from data/products.json and make a new valid for prestashop json file
# TODO save two photos per product (if exist) in prepared_data/photos/{photo_name}
# TODO for sized products (shoes) make combinations.json files with available sizes

import json
import os
from typing import Any, Dict, List

WANTED_SUBCATEGORIES: List[str] = [
    # Podróże i trekking
    "noże, scyzoryki i narzędzia",
    "akcesoria podróżne",
    # Buty
    "męskie",
    "damskie",
    # Wspinaczka
    "karabinki i ekspresy",
    "liny, taśmy i repy",
    # Skitour
    "foki i akcesoria",
    "wiązania i akcesoria"
]

SIZE_CATEGORIES: List[str] = ["buty"]

# File paths
abspath: str = os.path.dirname(os.path.abspath(__file__))
categories_file: str = os.path.join(abspath, "../data/categories.json")
input_data_file: str = os.path.join(abspath, "../data/products.json")
output_data_file: str = os.path.join(abspath, "prepared_products.json")
photos_output_dir: str = os.path.join(abspath, "photos")

def load_products(products_file: str) -> List[Dict[str, Any]]:
    '''Load products from a JSON file.'''
    with open(products_file, 'r', encoding='utf-8') as f:
        products: List[Dict[str, Any]] = json.load(f)
    return products

def load_categories(categories_file: str) -> Dict[str, Any]:
    '''Load categories from a JSON file.'''
    with open(categories_file, 'r', encoding='utf-8') as f:
        categories: Dict[str, Any] = json.load(f)
    return categories

# def post_categories(categories: Dict[str, Any]) -> Dict[str, int]:
    '''Post categories to Prestashop and return a mapping of category names to their Prestashop IDs.'''

def filter_products(products: List[Dict[str, Any]], WANTED_SUBCATEGORIES: List[str]) -> List[Dict[str, Any]]:
    '''Filter products based on wanted subcategories.'''
    filtered_products: List[Dict[str, Any]] = [
        product for product in products if product.get('subcategory') in WANTED_SUBCATEGORIES
    ]
    return filtered_products

def prepare_product_data(product: Dict[str, Any]) -> Dict[str, Any]:
    '''Prepare product data for Prestashop format.'''
    """
    "product": {
        "active": 1,
        "id_category_default": subcategory_id, # have use GET /api/categories to get category ids
        "price": price, # netto price
        "reference": product['parameters'].get('Kod EAN', ''),
        "ean13": product['parameters'].get('Kod EAN', ''),
        "name": {
            "language": [
                {
                    "id": 1,
                    "value": product['name']
                }
            ]},
        "description": {
            "language": [
                {
                    "id": 1,
                    "value": product['long_description']
                }
            ]},
        "description_short": {
            "language": [
                {
                    "id": 1,
                    "value": product['short_description']
                }
            ]},
        "minimal_quantity": 1,
        "id_tax_rules_group": 1,
        "depends_on_stock": if_size, # 1 for size products
        "out_of_stock": 0, # 0 - deny orders
        "quantity": total_quantity, # if_size == 1 do not contain quantity
        "associations": {
            "categories": [
                    {"id": root_id},
                    {"id": subcategory_id},
                    {"id": category_id}
            ]
    }
    
    """
# def save_prepared_data(prepared_products: List[Dict[str, Any]], output_data_file: str) -> None:
    '''Save prepared product data to a JSON file.'''

# def save_product_photos(product: Dict[str, Any], photos_dir: str) -> None:
    '''Save product photos to a specified directory.'''

# def generate_combinations(product: Dict[str, Any]) -> List[Dict[str, Any]]:
    '''Generate size combinations for sized products.'''

def main() -> None:
    '''Main function to prepare product data.'''
    products: List[Dict[str, Any]] = load_products(input_data_file)
    filtered_products: List[Dict[str, Any]] = filter_products(products, WANTED_SUBCATEGORIES)

if __name__ == "__main__":
    main()