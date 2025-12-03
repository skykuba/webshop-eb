"""Main script for preparing product data for PrestaShop."""

import sys
import os

# Add parent directories to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from prestashop.api import PrestaShopAPIClient
from config import (
    WANTED_SUBCATEGORIES,
    CATEGORIES_FILE,
    INPUT_DATA_FILE,
    OUTPUT_DATA_FILE,
    PHOTOS_OUTPUT_DIR
)
from categories_handler import load_categories, post_categories
from products_handler import (
    load_products,
    save_prepared_data,
    filter_products,
    prepare_product_data,
    post_product
)
from photos_handler import save_product_photos
from combinations_handler import generate_combinations
from discount_handler import put_discounts

def main() -> None:
    """Main function to prepare product data."""
    # Load data
    products = load_products(INPUT_DATA_FILE)
    categories = load_categories(CATEGORIES_FILE)
    
    filtered_products = filter_products(products, WANTED_SUBCATEGORIES)
    
    # TODO: Initialize API client and post categories
    # api_client = PrestaShopAPIClient()
    # category_id_map = post_categories(categories, api_client)
    
    # TODO: Prepare and post products
    # prepared_products = []
    # for product in filtered_products:
    #     prepared = prepare_product_data(product, category_id_map)
    #     prepared_products.append(prepared)
    #     post_product(prepared, api_client)
    #     save_product_photos(product, PHOTOS_OUTPUT_DIR)
    #     if product.get('category', '').lower() in ['buty']:
    #         generate_combinations(product)
    
    # TODO: Save prepared data
    # save_prepared_data(prepared_products, OUTPUT_DATA_FILE)


if __name__ == "__main__":
    main()