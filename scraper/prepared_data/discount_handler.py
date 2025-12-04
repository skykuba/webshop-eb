"""Handler for product discounts operations."""

import random
from typing import Dict, Any


def apply_discount(
    product_data: Dict[str, Any],
    min_discount_percentage: float = 0.05,
    max_discount_percentage: float = 0.6
) -> Dict[str, Any]:
    """ Apply a random discount to a product using specific_prices (proper promotion). """
    # Calculate random discount percentage
    discount_percentage = random.uniform(min_discount_percentage, max_discount_percentage)
    
    # Create specific_price entry for promotion (no dates = permanent)
    specific_price = {
        "id_shop": 1,
        "id_currency": 1,
        "id_country": 0,              # 0 = all countries
        "id_group": 0,                # 0 = all customer groups
        "id_customer": 0,             # 0 = all customers
        "id_product_attribute": 0,    # 0 = main product (not combination)
        "price": "-1.00",             # Required for percentage discount
        "from_quantity": 1,
        "reduction": f"{discount_percentage:.2f}",
        "reduction_type": "percentage",
    }
    
    # Add to associations -> specific_prices
    if 'associations' not in product_data['product']:
        product_data['product']['associations'] = {}
    
    if 'specific_prices' not in product_data['product']['associations']:
        product_data['product']['associations']['specific_prices'] = []
    
    product_data['product']['associations']['specific_prices'].append(specific_price)
    
    return product_data
