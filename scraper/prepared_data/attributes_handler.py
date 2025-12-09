"""Handler for attributes operations with PrestaShop."""

from typing import Dict, List
from prestashop.api import PrestaShopAPIClient
from config import SHOE_SIZES


def create_attribute_group(api_client: PrestaShopAPIClient, group_name: str = "Rozmiar") -> int:
    """ Create an attribute group in PrestaShop. """
    data = f'''<?xml version="1.0" encoding="UTF-8"?>
                <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
                    <product_option>
                        <is_color_group><![CDATA[0]]></is_color_group>
                        <group_type><![CDATA[select]]></group_type>
                        <name>
                            <language id="1"><![CDATA[{group_name}]]></language>
                        </name>
                        <public_name>
                            <language id="1"><![CDATA[{group_name}]]></language>
                        </public_name>
                    </product_option>
                </prestashop>
    '''
    try:
        response = api_client._make_request("POST", "product_options", data=data)
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
        data = f'''<?xml version="1.0" encoding="UTF-8"?>
                    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
                        <product_option_value>
                            <id_attribute_group><![CDATA[{group_id}]]></id_attribute_group>
                            <name>
                                <language id="1"><![CDATA[{str(size)}]]></language>
                            </name>
                        </product_option_value>
                    </prestashop>
        '''
        try:
            response = api_client._make_request("POST", "product_option_values", data=data)
            attribute_id = response['product_option_value']['id']
            size_id_map[size] = attribute_id
            print(f"Created size attribute: {size} (ID: {attribute_id})")
        except Exception as e:
            print(f"Error creating size attribute {size}: {e}")
    
    return size_id_map