"""Main script for preparing product data for PrestaShop."""

import sys
import os
import random

# Add parent directories to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from prestashop.api import PrestaShopAPIClient
from config import (
    WANTED_SUBCATEGORIES,
    SIZE_CATEGORIES,
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
from attributes_handler import create_attribute_group, create_size_attributes
from discount_handler import apply_discount


def main() -> None:
    """Main function to prepare product data."""
    print("=" * 80)
    print("PREPARING PRODUCT DATA FOR PRESTASHOP")
    print("=" * 80)
    
    # Load data
    print("\n[1/8] Loading data...")
    products = load_products(INPUT_DATA_FILE)
    categories = load_categories(CATEGORIES_FILE)
    filtered_products = filter_products(products, WANTED_SUBCATEGORIES)
    print(f"Loaded {len(filtered_products)} filtered products")
    
    # Initialize API client
    print("\n[2/8] Initializing PrestaShop API client...")
    api_client = PrestaShopAPIClient()
    
    # Post categories
    print("\n[3/8] Creating categories in PrestaShop...")
    category_id_map = post_categories(categories, api_client)
    print(f"Created {len(category_id_map)} categories")
    
    # Create size attributes for shoes
    print("\n[4/8] Creating size attributes...")
    size_group_id = create_attribute_group(api_client)
    size_id_map = create_size_attributes(api_client, size_group_id)
    print(f"Created size group (ID: {size_group_id}) with sizes")
    
    # Prepare and post products
    print("\n[5/8] Preparing and posting products...")
    prepared_products = []
    discount_chance = 0.05  # 5% chance for discount
    
    for i, product in enumerate(filtered_products, 1):
        product_id = -1
        print(f"\nProcessing product {i}/{len(filtered_products)}")
        
        # Prepare product data
        prepared = prepare_product_data(product, category_id_map)
        
        # Apply random discount
        if random.random() < discount_chance:
            prepared = apply_discount(prepared)
        
        # Post product to PrestaShop
        product_id = post_product(prepared, api_client)
        
        if product_id != -1:
            # Save photos
            print("\n[6/8] Saving product photos...")
            save_product_photos(product, PHOTOS_OUTPUT_DIR)
            
            # Generate combinations for sized products (shoes)
            category_name = product.get('category', '').lower()
            if category_name in SIZE_CATEGORIES:
                print("\n[7/8] Generating size combinations...")
                generate_combinations(product_id, size_id_map, api_client)
        
        prepared_products.append(prepared)
    
    # Save prepared data
    print("\n[8/8] Saving prepared data to JSON...")
    save_prepared_data(prepared_products, OUTPUT_DATA_FILE)
    
    print("\n" + "=" * 80)
    print("COMPLETED!")
    print(f"Total products processed: {len(prepared_products)}")
    print("=" * 80)


if __name__ == "__main__":
    main()