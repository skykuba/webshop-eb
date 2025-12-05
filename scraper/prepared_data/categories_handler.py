"""Handler for category operations with PrestaShop."""

import json
from typing import Dict, List, Any
from prestashop.api import PrestaShopAPIClient
from config import WANTED_CATEGORIES, WANTED_SUBCATEGORIES
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
    def find_categories_recursive(cats: List[Dict[str, Any]], parent_id: int = 2, parent_name: str = "Root") -> None:
        for cat in cats:
            cat_name = cat['name']
            
            # Check if this is a wanted category or subcategory
            is_wanted_category = cat_name in WANTED_CATEGORIES
            is_wanted_subcategory = cat_name in WANTED_SUBCATEGORIES
            
            # Only process if it's a wanted category or subcategory
            if is_wanted_category or is_wanted_subcategory:
                print(f"Creating category: {cat_name} (parent: {parent_name}, parent_id: {parent_id})")
                
                # Create category in PrestaShop
                data = f'''<?xml version="1.0" encoding="UTF-8"?>
                            <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
                            <category>
                                <name>
                                    <language id="1"><![CDATA[{cat_name}]]></language>
                                </name>
                                <link_rewrite>
                                    <language id="1"><![CDATA[{cat_name.lower().replace(' ', '-').replace(',', '')}]]></language>
                                </link_rewrite>
                                <active>1</active>
                                <id_parent>{parent_id}</id_parent>
                            </category>
                            </prestashop>'''
                
                try:
                    response = api_client._make_request("POST", "categories", data=data)
                    category_id = response['category']['id']
                    category_id_map[cat_name] = category_id
                    print(f"✓ Created category '{cat_name}' with ID: {category_id}")
                    
                    # Process children (subcategories) with this category as parent
                    if cat.get('children'):
                        find_categories_recursive(cat['children'], category_id, cat_name)
                        
                except Exception as e:
                    print(f"✗ Error creating category {cat_name}: {e}")
            else:
                # Even if this category is not wanted, check its children
                # (in case subcategories are wanted but parent is not)
                if cat.get('children') and is_wanted_category:
                    find_categories_recursive(cat['children'], parent_id, parent_name)
    
    # Start processing from root
    find_categories_recursive(categories)
    
    return category_id_map
