"""Handler for category operations with PrestaShop."""

import json
from typing import Dict, List, Any
from prestashop.api import PrestaShopAPIClient
from config import WANTED_CATEGORIES
from convert_to_XML import json_to_xml


def load_categories(categories_file: str) -> List[Dict[str, Any]]:
    """Load categories from a JSON file."""
    with open(categories_file, 'r', encoding='utf-8') as f:
        categories: List[Dict[str, Any]] = json.load(f)
    return categories


def post_categories(categories: List[Dict[str, Any]], api_client: PrestaShopAPIClient) -> Dict[str, int]:
    """Post categories to Prestashop and return a mapping of category names to their Prestashop IDs."""
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
                            "language": [
                                {
                                    "id": 1,
                                    "value": cat_name
                                }
                            ]
                        },
                        "link_rewrite": {
                            "language": [
                                {
                                    "id": 1,
                                    "value": cat_name.lower().replace(' ', '-').replace(',', '')
                                }
                            ]
                        }
                    }
                }
                
                try:
                    xml_data = json_to_xml(category_data)
                    response = api_client._make_request("POST", "categories", data=xml_data)
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
