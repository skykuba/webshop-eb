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
    INPUT_TEST_DATA_FILE,
    OUTPUT_DATA_FILE,
    PHOTOS_OUTPUT_DIR
)
from categories_handler import load_categories, post_categories
from products_handler import (
    load_products,
    save_prepared_data,
    filter_products,
    prepare_product_data,
    post_product,
    set_product_stock
)
from photos_handler import save_product_photos, post_photos
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
    discount_chance = 0.10  # chance for discount
    
    # Load and process test products first
    print("\n[5a/8] Processing test products with fixed quantity...")
    test_products = load_products(INPUT_TEST_DATA_FILE)
    test_filtered_products = filter_products(test_products, WANTED_SUBCATEGORIES)
    print(f"Loaded {len(test_filtered_products)} test products")
    
    for i, product in enumerate(test_filtered_products, 1):
        product_name = product.get('name', 'Unknown')
        print(f"\n--- Processing TEST product {i}/{len(test_filtered_products)}: {product_name} ---")
        
        prepared = prepare_product_data(product, category_id_map)
        product_id = post_product(prepared, api_client)
        
        if product_id > 0:
            if random.random() < discount_chance:
                apply_discount(product_id, api_client=api_client)
            
            if product.get('category') in SIZE_CATEGORIES:
                # For test products: fixed quantity, if_random_quantity=False
                generate_combinations(product_id, size_id_map, api_client, if_random_quantity=False)
            else:
                # For test products: fixed quantity = 10
                set_product_stock(product_id, 10, api_client, is_sized=False)
            
            photos = save_product_photos(product, PHOTOS_OUTPUT_DIR)
            post_photos(product_id, photos, api_client)
        
        prepared_products.append(prepared)
    
    # Process regular filtered products
    print("\n[5b/8] Processing regular products...")
    for i, product in enumerate(filtered_products, 1):
        product_name = product.get('name', 'Unknown')
        
        print(f"\n--- Processing product {i}/{len(filtered_products)}: {product_name} ---")
        
        # Prepare product data
        prepared = prepare_product_data(product, category_id_map)
        product_id = post_product(prepared, api_client)
        
        if product_id > 0:
            # Apply random discount
            if random.random() < discount_chance:
                apply_discount(product_id, api_client=api_client)
            
            if product.get('category') in SIZE_CATEGORIES:
                generate_combinations(product_id, size_id_map, api_client)
            else:
                if random.random() < 0.10:
                    quantity = 0  # Out of stock
                else:
                    quantity = random.randint(3, 10)
                set_product_stock(product_id, quantity, api_client, is_sized=False)
            
            photos = save_product_photos(product, PHOTOS_OUTPUT_DIR)
            post_photos(product_id, photos, api_client)
        
        prepared_products.append(prepared)
    
    # Save prepared data
    print("\n[8/8] Saving prepared data to JSON...")
    save_prepared_data(prepared_products, OUTPUT_DATA_FILE)
    
    print("\n" + "=" * 80)
    print(f"Total products processed: {len(prepared_products)}")
    print("=" * 80)


if __name__ == "__main__":
    main()