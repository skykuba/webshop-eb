"""Handler for product discounts operations."""

import random
from typing import Dict, Any
from prestashop.api import PrestaShopAPIClient

def apply_discount(
    product_id: int,
    min_discount_percentage: float = 0.05,
    max_discount_percentage: float = 0.6.
    api_client=PrestaShopAPIClient
) -> Dict[str, Any]:
    """ Apply a random discount to a product using specific_prices (proper promotion). """
    # Calculate random discount percentage
    discount_percentage = random.uniform(min_discount_percentage, max_discount_percentage)

    # Create specific_price entry for promotion (no dates = permanent)
    specific_price = f'''   <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
                            <specific_price>
                                <id_shop><![CDATA[1]]></id_shop>
                                <id_cart><![CDATA[0]]></id_cart>
                                <id_product><![CDATA[{product_id}]]></id_product>
                                <id_product_attribute><![CDATA[]]></id_product_attribute>
                                <id_currency><![CDATA[0]]></id_currency>
                                <id_country><![CDATA[0]]></id_country>
                                <id_group><![CDATA[0]]></id_group>
                                <id_customer><![CDATA[0]]></id_customer>
                                <price><![CDATA[-1]]></price>
                                <from_quantity><![CDATA[1]]></from_quantity>
                                <reduction><![CDATA[{discount_percentage}]]></reduction>
                                <reduction_tax><![CDATA[0]]></reduction_tax>
                                <reduction_type><![CDATA[percentage]]></reduction_type>
                                <from><![CDATA[0000-00-00 00:00:00]]></from>
                                <to><![CDATA[0000-00-00 00:00:00]]></to>
                            </specific_price>
                            </prestashop>'''
    
    try:
        response = api_client._make_request("POST", "specific_prices", data=specific_price)
        specific_price_id = response['specific_price']['id']
        print(f"Applied discount of {discount_percentage*100:.2f}% to product {product_id} (Specific Price ID: {specific_price_id})")
    except Exception as e:
        print(f"Error applying discount to product {product_id}: {e}")

    return product_data
