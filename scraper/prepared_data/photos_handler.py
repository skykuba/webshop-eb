"""Handler for product photos operations."""

import os
import shutil
from typing import Dict, Any, List
from prestashop.api import PrestaShopAPIClient

def save_product_photos(product: Dict[str, Any], output_photos_dir: str, source_photos_dir: str = "../data/photos") -> List[str]:
    os.makedirs(output_photos_dir, exist_ok=True)
    
    current_dir = os.path.dirname(os.path.abspath(__file__))
    source_dir = os.path.join(current_dir, source_photos_dir)
    
    saved_photos: List[str] = []
    photos_to_copy: List[str] = []
    
    # Get thumbnail
    thumbnail = product.get('thumbnail')
    if thumbnail:
        photos_to_copy.append(thumbnail)
    
    photos = product.get('photos', [])
    for photo in photos:
        if photo != thumbnail and photo not in photos_to_copy:
            photos_to_copy.append(photo)
            if len(photos_to_copy) >= 2:
                break
    
    # Copy photos from source to output directory
    for photo_url in photos_to_copy:
        try:
            # Extract filename from URL
            filename = photo_url.split('/')[-1]
            source_filepath = os.path.join(source_dir, filename)
            output_filepath = os.path.join(output_photos_dir, filename)

            if not os.path.exists(source_filepath):
                print(f"Source photo not found: {filename}")
                continue
            
            # Skip if already exists in output
            if os.path.exists(output_filepath):
                saved_photos.append(filename)
                continue
            
            # Copy file
            shutil.copy2(source_filepath, output_filepath)
            saved_photos.append(filename)

        except Exception as e:
            print(f"Error copying photo {photo_url}: {e}")
    
    return saved_photos

def post_photos(product_id: int, photo_filenames: List[str], api_client: PrestaShopAPIClient) -> None:
    """Post photos to PrestaShop for the given product ID."""
    current_dir = os.path.dirname(os.path.abspath(__file__))
    photos_dir = os.path.join(current_dir, "../prepared_data/photos")
    for filename in photo_filenames:
        try:
            filepath = os.path.join(photos_dir, filename)
            with open(filepath, 'rb') as photo_file:
                file = {'image': photo_file}
                response = api_client._make_request("POST", f"images/products/{product_id}", file)
        except Exception as e:
            print(f"Error posting photo {filename} for product {product_id}: {e}")