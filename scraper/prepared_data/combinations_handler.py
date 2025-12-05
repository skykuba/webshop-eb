"""Handler for product combinations (sizes)."""

import random
from typing import Dict, List, Optional
from prestashop.api import PrestaShopAPIClient
from config import SHOE_SIZES
from convert_to_XML import json_to_xml


def generate_combinations(
    product_id: int,
    size_id_map: Dict[int, int],
    api_client: PrestaShopAPIClient,
    available_sizes: Optional[List[int]] = None
) -> None:
    """ Generate and post size combinations for a product. """
    if available_sizes is None:
        available_sizes = SHOE_SIZES
    
    # Shuffle sizes for random selection
    random.shuffle(available_sizes)
    
    unavailable_probability = 0.2  # Start at 20%
    
    for size in available_sizes:
        # Check if this size should be unavailable (not visible in shop)
        if random.random() < unavailable_probability:
            # Size is unavailable - skip creating this combination
            # Reset probability back to 20%
            unavailable_probability = 0.2
            continue
        
        # Size is available - create combination
        quantity = random.randint(1, 10)  
        attribute_id = size_id_map.get(size)
        
        if attribute_id is None:
            print(f"Warning: No attribute ID found for size {size}")
            continue

        # Create combination (without quantity - that's set via stock_availables)
        data = f"""<?xml version="1.0" encoding="UTF-8"?>
<prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
    <combination>
        <id_product><![CDATA[{product_id}]]></id_product>
        <minimal_quantity><![CDATA[1]]></minimal_quantity>
        <associations>
            <product_option_values>
                <product_option_value>
                    <id><![CDATA[{attribute_id}]]></id>
                </product_option_value>
            </product_option_values>
        </associations>
    </combination>
</prestashop>"""
        
        try:
            response = api_client._make_request("POST", "combinations", data)
            combination_id = int(response['combination']['id'])
            print(f"Created combination: Size {size} (ID: {combination_id})")
            
            # Now set stock for this combination
            set_combination_stock(product_id, combination_id, quantity, api_client)
            
        except Exception as e:
            print(f"Error creating combination for size {size}: {e}")
        
        # Increase unavailable probability by 20 percentage points
        unavailable_probability = min(unavailable_probability + 0.2, 1.0)


def set_combination_stock(
    product_id: int,
    combination_id: int,
    quantity: int,
    api_client: PrestaShopAPIClient
) -> bool:
    """Set stock quantity for a specific combination."""
    try:
        # Get stock_available for this combination
        response = api_client._make_request(
            "GET",
            f"stock_availables?filter[id_product]={product_id}&filter[id_product_attribute]={combination_id}&display=full"
        )
        
        # Handle both dict and list responses
        if isinstance(response, dict):
            stock_availables = response.get('stock_availables', [])
        else:
            stock_availables = response
            
        if not stock_availables:
            print(f"No stock_available found for combination {combination_id}")
            return False
        
        stock_id = int(stock_availables[0]['id'])
        
        # Update stock quantity for this combination
        xml_data = f"""<?xml version="1.0" encoding="UTF-8"?>
<prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
    <stock_available>
        <id><![CDATA[{stock_id}]]></id>
        <id_product><![CDATA[{product_id}]]></id_product>
        <id_product_attribute><![CDATA[{combination_id}]]></id_product_attribute>
        <id_shop><![CDATA[1]]></id_shop>
        <quantity><![CDATA[{quantity}]]></quantity>
        <depends_on_stock><![CDATA[0]]></depends_on_stock>
        <out_of_stock><![CDATA[2]]></out_of_stock>
    </stock_available>
</prestashop>"""
        
        api_client._make_request("PUT", f"stock_availables/{stock_id}", data=xml_data)
        print(f"Set stock for combination {combination_id}: {quantity} units")
        return True
        
    except Exception as e:
        print(f"Error setting stock for combination {combination_id}: {e}")
        return False

