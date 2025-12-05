"""Handler for attributes operations with PrestaShop."""

from typing import Dict, List
from prestashop.api import PrestaShopAPIClient
from config import SHOE_SIZES
from convert_to_XML import json_to_xml


def create_attribute_group(api_client: PrestaShopAPIClient, group_name: str = "Rozmiar") -> int:
    """ Create an attribute group in PrestaShop. """
    attribute_group_data = {
        "product_option": {
            "is_color_group": 0,
            "group_type": "select",
            "position": 1,
            "name": {
                "language": [
                    {
                        "id": 1,
                        "value": group_name
                    }
                ]
            },
            "public_name": {
                "language": [
                    {
                        "id": 1,
                        "value": group_name
                    }
                ]
            }
        }
    }
    
    try:
        xml_data = json_to_xml(attribute_group_data)
        response = api_client._make_request("POST", "product_options", data=xml_data)
        group_id = response['product_option']['id']
        print(f"Created attribute group: {group_name} (ID: {group_id})")
        return group_id
    except Exception as e:
        print(f"Error creating attribute group {group_name}: {e}")
        return 0


def create_size_attributes(api_client: PrestaShopAPIClient, group_id: int, sizes: List[int] = None) -> Dict[int, int]:
    """ Create size attributes in PrestaShop for the given attribute group. """
    if sizes is None:
        sizes = SHOE_SIZES
    
    size_id_map: Dict[int, int] = {}
    
    for size in sizes:
        attribute_data = {
            "product_option_value": {
                "id_attribute_group": group_id,
                "name": {
                    "language": [
                        {
                            "id": 1,
                            "value": str(size)
                        }
                    ]
                }
            }
        }
        
        try:
            xml_data = json_to_xml(attribute_data)
            response = api_client._make_request("POST", "product_option_values", data=xml_data)
            attribute_id = response['product_option_value']['id']
            size_id_map[size] = attribute_id
            print(f"Created size attribute: {size} (ID: {attribute_id})")
        except Exception as e:
            print(f"Error creating size attribute {size}: {e}")
    
    return size_id_map