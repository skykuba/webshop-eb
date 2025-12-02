import json
from typing import Dict, List, Any
import os

def load_products(file_path: str) -> List[Dict[str, Any]]:
    # Load products from JSON file.
    with open(file_path, 'r', encoding='utf-8') as f:
        products: List[Dict[str, Any]] = json.load(f)
    return products


def assign_products(products: List[Dict[str, Any]]) -> Dict[str, Dict[str, List[Dict[str, Any]]]]:
    categories_dict: Dict[str, Dict[str, List[Dict[str, Any]]]] = {}
    
    for product in products:
        category: str = product.get('category')
        subcategory: str = product.get('subcategory')
        
        if category not in categories_dict:
            categories_dict[category] = {}
        
        if subcategory not in categories_dict[category]:
            categories_dict[category][subcategory] = []
        
        categories_dict[category][subcategory].append(product)
    
    return categories_dict

def save_categories_statistics(statistics: Dict[str, Dict[str, int]], output_file: str) -> None:
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(statistics, f, ensure_ascii=False, indent=2)


def categories_statistics(categories_dict: Dict[str, Dict[str, List[Dict[str, Any]]]], output_file: str) -> None:
    statistics: Dict[str, Dict[str, int]] = {}
    
    for category, subcategories in categories_dict.items():
        # Products with root category are products from the main site. Can be skipped.
        if category == "Root":
            continue

        statistics[category] = {}
        category_total: int = 0
        
        for subcategory, products_list in subcategories.items():
            product_count: int = len(products_list)
            category_total += product_count
            statistics[category][subcategory] = product_count
        
        statistics[category]['_total'] = category_total
    
    save_categories_statistics(statistics, output_file)
            

def main() -> None:
    # Get the path to products.json
    script_dir: str = os.path.dirname(os.path.abspath(__file__))
    products_file: str = os.path.join(script_dir, '..', 'data', 'products.json')
    output_file: str = os.path.join(script_dir, 'products_in_categories.json')

    products: List[Dict[str, Any]] = load_products(products_file)
    categories_dict: Dict[str, Dict[str, List[Dict[str, Any]]]] = assign_products(products)
    
    categories_statistics(categories_dict, output_file)
    

if __name__ == '__main__':
    main()
