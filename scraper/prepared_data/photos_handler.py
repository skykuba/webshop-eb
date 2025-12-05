"""Handler for product photos operations."""

import os
import shutil
from typing import Dict, Any, List
from PIL import Image
from prestashop.api import PrestaShopAPIClient


def save_product_photos(product: Dict[str, Any], output_photos_dir: str, source_photos_dir: str = "../data/photos") -> List[str]:
    """Copy up to 2 product photos from source to output directory."""
    os.makedirs(output_photos_dir, exist_ok=True)
    current_dir = os.path.dirname(os.path.abspath(__file__))
    source_dir = os.path.join(current_dir, source_photos_dir)
    
    saved_photos = []
    photos_to_copy = []
    
    if product.get('thumbnail'):
        photos_to_copy.append(product['thumbnail'])
    
    for photo in product.get('photos', []):
        if photo not in photos_to_copy:
            photos_to_copy.append(photo)
            if len(photos_to_copy) >= 2:
                break
    
    for photo_url in photos_to_copy:
        try:
            filename = photo_url.split('/')[-1]
            source_filepath = os.path.join(source_dir, filename)
            output_filepath = os.path.join(output_photos_dir, filename)

            if not os.path.exists(source_filepath):
                continue
            
            if not os.path.exists(output_filepath):
                shutil.copy2(source_filepath, output_filepath)
            
            saved_photos.append(filename)
        except:
            pass
    
    return saved_photos


def compress_image(input_path: str, output_path: str, max_size_kb: int = 3000) -> bool:
    """Compress image to fit within max_size_kb."""
    try:
        max_size_bytes = max_size_kb * 1024
        
        with Image.open(input_path) as img:
            if img.mode in ('RGBA', 'LA', 'P'):
                background = Image.new('RGB', img.size, (255, 255, 255))
                if img.mode == 'P':
                    img = img.convert('RGBA')
                background.paste(img, mask=img.split()[-1] if img.mode == 'RGBA' else None)
                img = background
            elif img.mode != 'RGB':
                img = img.convert('RGB')
            
            quality = 85
            while quality > 20:
                img.save(output_path, 'JPEG', quality=quality, optimize=True)
                if os.path.getsize(output_path) <= max_size_bytes:
                    return True
                quality -= 5
            
            width, height = img.size
            while os.path.getsize(output_path) > max_size_bytes:
                width, height = int(width * 0.9), int(height * 0.9)
                resized = img.resize((width, height), Image.Resampling.LANCZOS)
                resized.save(output_path, 'JPEG', quality=75, optimize=True)
                if os.path.getsize(output_path) <= max_size_bytes:
                    return True
            
            return os.path.getsize(output_path) <= max_size_bytes
    except:
        return False


def post_photos(product_id: int, photo_filenames: List[str], api_client: PrestaShopAPIClient) -> None:
    """Post photos to PrestaShop for the given product ID."""
    photos_dir = os.path.join(os.path.dirname(__file__), "../prepared_data/photos")
    
    for filename in photo_filenames:
        try:
            filepath = os.path.join(photos_dir, filename)
            if not os.path.exists(filepath):
                print(f"  Photo not found: {filename}")
                continue
            
            file_size = os.path.getsize(filepath)
            max_size = 3000 * 1024
            upload_path = filepath
            compressed = False
            
            # Convert WebP to JPEG (PrestaShop doesn't support WebP)
            if filepath.lower().endswith('.webp'):
                print(f"  Converting WebP to JPEG: {filename}")
                jpeg_path = os.path.join(photos_dir, f"converted_{filename.rsplit('.', 1)[0]}.jpg")
                try:
                    with Image.open(filepath) as img:
                        if img.mode in ('RGBA', 'LA', 'P'):
                            background = Image.new('RGB', img.size, (255, 255, 255))
                            if img.mode == 'P':
                                img = img.convert('RGBA')
                            background.paste(img, mask=img.split()[-1] if img.mode == 'RGBA' else None)
                            img = background
                        elif img.mode != 'RGB':
                            img = img.convert('RGB')
                        img.save(jpeg_path, 'JPEG', quality=85, optimize=True)
                    upload_path = jpeg_path
                    compressed = True
                    file_size = os.path.getsize(jpeg_path)
                except Exception as e:
                    print(f"  WebP conversion failed: {e}, skipping")
                    continue
            
            if file_size > max_size:
                print(f"  Compressing {filename} ({file_size / 1024:.0f}KB)...")
                compressed_path = os.path.join(photos_dir, f"compressed_{os.path.basename(upload_path)}")
                
                if compress_image(upload_path, compressed_path, max_size_kb=3000):
                    if upload_path != filepath and os.path.exists(upload_path):
                        os.remove(upload_path)
                    upload_path = compressed_path
                    compressed = True
                else:
                    print(f"  Compression failed, skipping")
                    if upload_path != filepath and os.path.exists(upload_path):
                        os.remove(upload_path)
                    continue
            
            response = api_client.upload_image(f"images/products/{product_id}", upload_path)
            
            if compressed and os.path.exists(upload_path):
                os.remove(upload_path)
            
            print(f"  Uploaded {filename}")
                
        except Exception as e:
            print(f"  Error uploading {filename}: {e}")
