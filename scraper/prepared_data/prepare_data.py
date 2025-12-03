# TODO take choosen products from data/products.json and make a new valid for prestashop json file
# TODO save two photos per product (if exist) in prepared_data/photos/{photo_name}
# TODO for sized products (shoes) make combinations.json files with available sizes
import json
import os
from typing import Any, Dict, List

WANDTED_SUBATEGORIES: List[str] = []

# File paths
abspath: str = os.path.dirname(os.path.abspath(__file__))
input_data_file: str = os.path.join(abspath, "../data/products.json")
output_data_file: str = os.path.join(abspath, "prepared_products.json")
photos_output_dir: str = os.path.join(abspath, "photos")

def load_products(products_file: str) -> List[Dict[str, Any]]:
    '''Load products from a JSON file.'''
    with open(products_file, 'r', encoding='utf-8') as f:
        products: List[Dict[str, Any]] = json.load(f)
    return products

# def filter_products(products: List[Dict[str, Any]], WANTED_SUBCATEGORIES: List[str]) -> List[Dict[str, Any]]:
'''Filter products based on wanted subcategories.'''

# def prepare_product_data(product: Dict[str, Any]) -> Dict[str, Any]:
'''Prepare product data for Prestashop format.'''

# def save_prepared_data(prepared_products: List[Dict[str, Any]], output_data_file: str) -> None:
'''Save prepared product data to a JSON file.'''

# def save_product_photos(product: Dict[str, Any], photos_dir: str) -> None:
'''Save product photos to a specified directory.'''

# def generate_combinations(product: Dict[str, Any]) -> List[Dict[str, Any]]:
'''Generate size combinations for sized products.'''

# def main() -> None:
'''Main function to prepare product data.'''

if __name__ == "__main__":
    main()