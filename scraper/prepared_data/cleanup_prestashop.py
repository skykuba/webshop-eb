"""Script to clean up PrestaShop - delete all products, categories, attributes, and attribute groups."""

import sys
import os

# Add parent directories to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from prestashop.api import PrestaShopAPIClient


def delete_all_product_images(api_client: PrestaShopAPIClient) -> None:
    """Delete all product images."""
    print("Deleting product images...")
    try:
        # First get all products
        response = api_client._make_request("GET", "products")
        products = response.get('products', [])
        
        deleted_count = 0
        for product in products:
            product_id = int(product['id'])
            if product_id <= 2:
                continue
            
            try:
                # Get all images for this product
                images_response = api_client._make_request("GET", f"images/products/{product_id}")
                
                # Handle different response formats
                images = []
                if isinstance(images_response, dict):
                    if 'image' in images_response:
                        # Single image
                        images = [images_response['image']]
                    elif 'images' in images_response:
                        # Multiple images
                        images = images_response['images']
                
                # Delete each image
                for image in images:
                    if isinstance(image, dict):
                        image_id = image.get('id')
                    else:
                        image_id = image
                    
                    if image_id:
                        try:
                            api_client._make_request("DELETE", f"images/products/{product_id}/{image_id}")
                            deleted_count += 1
                        except:
                            pass
            except:
                # Product has no images or error getting them
                pass
        
        print(f"  Deleted {deleted_count} product images")
    except Exception as e:
        print(f"  Error: {e}")


def delete_all_products(api_client: PrestaShopAPIClient) -> None:
    """Delete all products except default ones (ID 1-2)."""
    print("Deleting products...")
    try:
        response = api_client._make_request("GET", "products")
        products = response.get('products', [])
        
        deleted_count = 0
        for product in products:
            product_id = int(product['id'])
            if product_id <= 2:
                continue
            
            try:
                api_client._make_request("DELETE", f"products/{product_id}")
                deleted_count += 1
            except:
                pass
        
        print(f"  Deleted {deleted_count} products")
    except Exception as e:
        print(f"  Error: {e}")


def delete_all_combinations(api_client: PrestaShopAPIClient) -> None:
    """Delete all product combinations."""
    print("Deleting combinations...")
    try:
        response = api_client._make_request("GET", "combinations")
        combinations = response.get('combinations', [])
        
        deleted_count = 0
        for combination in combinations:
            combination_id = int(combination['id'])
            try:
                api_client._make_request("DELETE", f"combinations/{combination_id}")
                deleted_count += 1
            except:
                pass
        
        print(f"  Deleted {deleted_count} combinations")
    except Exception as e:
        print(f"  Error: {e}")


def delete_all_attributes(api_client: PrestaShopAPIClient) -> None:
    """Delete all product attribute values."""
    print("Deleting attribute values...")
    try:
        response = api_client._make_request("GET", "product_option_values")
        attributes = response.get('product_option_values', [])
        
        deleted_count = 0
        for attribute in attributes:
            attribute_id = int(attribute['id'])
            try:
                api_client._make_request("DELETE", f"product_option_values/{attribute_id}")
                deleted_count += 1
            except:
                pass
        
        print(f"  Deleted {deleted_count} attribute values")
    except Exception as e:
        print(f"  Error: {e}")


def delete_all_attribute_groups(api_client: PrestaShopAPIClient) -> None:
    """Delete all product attribute groups."""
    print("Deleting attribute groups...")
    try:
        response = api_client._make_request("GET", "product_options")
        groups = response.get('product_options', [])
        
        deleted_count = 0
        for group in groups:
            group_id = int(group['id'])
            try:
                api_client._make_request("DELETE", f"product_options/{group_id}")
                deleted_count += 1
            except:
                pass
        
        print(f"  Deleted {deleted_count} attribute groups")
    except Exception as e:
        print(f"  Error: {e}")


def delete_all_categories(api_client: PrestaShopAPIClient) -> None:
    """Delete all categories except default ones (ID 1-2)."""
    print("Deleting categories...")
    try:
        response = api_client._make_request("GET", "categories")
        categories = response.get('categories', [])
        
        # Sort by ID in descending order to delete children first
        categories_sorted = sorted(categories, key=lambda x: int(x['id']), reverse=True)
        
        deleted_count = 0
        for category in categories_sorted:
            category_id = int(category['id'])
            if category_id <= 2:
                continue
            
            try:
                api_client._make_request("DELETE", f"categories/{category_id}")
                deleted_count += 1
            except:
                pass
        
        print(f"  Deleted {deleted_count} categories")
    except Exception as e:
        print(f"  Error: {e}")


def main() -> None:
    """Main cleanup function."""
    print("Cleaning up PrestaShop...")
    
    api_client = PrestaShopAPIClient()
    
    # Delete images first (before deleting products)
    delete_all_product_images(api_client)
    delete_all_products(api_client)
    delete_all_combinations(api_client)
    delete_all_attributes(api_client)
    delete_all_attribute_groups(api_client)
    delete_all_categories(api_client)
    
    print("\nCleanup completed!")


if __name__ == "__main__":
    main()
