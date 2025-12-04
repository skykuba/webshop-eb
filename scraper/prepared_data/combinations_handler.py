"""Handler for product combinations (sizes)."""

import random
from typing import Dict, List, Optional
from prestashop.api import PrestaShopAPIClient
from config import SHOE_SIZES


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
        
        combination_data = {
            "combination": {
                "id_product": product_id,
                "quantity": quantity,
                "minimal_quantity": 1,
                "associations": {
                    "product_option_values": [
                        {"id": attribute_id}
                    ]
                }
            }
        }
        
        try:
            response = api_client._make_request("POST", "combinations", data=combination_data)
            combination_id = response['combination']['id']
            print(f"Created combination: Size {size}, Quantity {quantity} (ID: {combination_id})")
        except Exception as e:
            print(f"Error creating combination for size {size}: {e}")
        
        # Increase unavailable probability by 20 percentage points
        unavailable_probability = min(unavailable_probability + 0.2, 1.0)
