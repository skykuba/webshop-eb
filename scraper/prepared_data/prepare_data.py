# TODO POST used categories to prestashop to get category ids
# TODO take choosen products from data/products.json and make a new valid for prestashop json file
# TODO save two photos per product (if exist) in prepared_data/photos/{photo_name}
# TODO for sized products (shoes) make combinations.json files with available sizes

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

import json
import os
import sys
from typing import Any, Dict, List
from prestashop.api import PrestaShopAPIClient


WANTED_CATEGORIES: List[str] = [
    "Podróże i trekking",
    "Buty",
    "Wspinaczka",
    "Skitour"
]

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

def post_categories(categories: List[Dict[str, Any]], api_client: PrestaShopAPIClient) -> Dict[str, int]:
    '''Post categories to Prestashop and return a mapping of category names to their Prestashop IDs.'''
    category_id_map: Dict[str, int] = {}
    
    category_id_map['Root'] = 2
    
    # Helper function to find categories in nested structure
    def find_categories_recursive(cats: List[Dict[str, Any]], parent_id: int = 2) -> None:
        for cat in cats:
            cat_name = cat['name']
            
            is_wanted_category = cat_name in WANTED_CATEGORIES
            
            # Only process if it's a wanted category
            if is_wanted_category:
                # Create category in PrestaShop
                category_data = {
                    "category": {
                        "active": 1,
                        "id_parent": parent_id,
                        "name": {
                            "language": {
                                "id": 1,
                                "value": cat_name
                            }
                        },
                        "link_rewrite": {
                            "language": {
                                "id": 1,
                                "value": cat_name.lower().replace(' ', '-').replace(',', '')
                            }
                        }
                    }
                }
                
                try:
                    response = api_client._make_request("POST", "categories", data=category_data)
                    category_id = response['category']['id']
                    category_id_map[cat_name] = category_id
                    
                    # Process children (subcategories) with this category as parent
                    if cat.get('children'):
                        find_categories_recursive(cat['children'], category_id)
                        
                except Exception as e:
                    print(f"Error creating category {cat_name}: {e}")
    
    # Start processing from root
    find_categories_recursive(categories)
    
    return category_id_map


def filter_products(products: List[Dict[str, Any]], WANTED_SUBCATEGORIES: List[str]) -> List[Dict[str, Any]]:
    '''Filter products based on wanted subcategories.'''
    filtered_products: List[Dict[str, Any]] = [
        product for product in products if product.get('subcategory') in WANTED_SUBCATEGORIES
    ]
    return filtered_products

def prepare_product_data(product: Dict[str, Any], category_id_map: Dict[str, int]) -> Dict[str, Any]:
    '''Prepare product data for Prestashop format.'''
    
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

# def post_product(prepared_product: Dict[str, Any], api_client: PrestaShopAPIClient) -> None:
    '''Post a product to Prestashop and return the product ID.'''

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