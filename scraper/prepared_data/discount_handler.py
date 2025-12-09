"""Handler for product discounts operations."""

import random
from prestashop.api import PrestaShopAPIClient

def apply_discount(
    product_id: int,
    min_discount_percentage: float = 0.05,
    max_discount_percentage: float = 0.6,
    api_client: PrestaShopAPIClient = PrestaShopAPIClient()
) -> None:
    """ Apply a random discount to a product using specific_prices (proper promotion). """
    # Random discount percentage
    discount_percentage = random.uniform(min_discount_percentage, max_discount_percentage)

    # Create specific_price entry for promotion
    specific_price = f'''<?xml version="1.0" encoding="UTF-8"?>
<prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
<specific_price>
    <id_shop_group><![CDATA[0]]></id_shop_group>
    <id_shop><![CDATA[1]]></id_shop>
    <id_cart><![CDATA[0]]></id_cart>
    <id_product><![CDATA[{product_id}]]></id_product>
    <id_product_attribute><![CDATA[0]]></id_product_attribute>
    <id_currency><![CDATA[0]]></id_currency>
    <id_country><![CDATA[0]]></id_country>
    <id_group><![CDATA[0]]></id_group>
    <id_customer><![CDATA[0]]></id_customer>
    <price><![CDATA[-1.00]]></price>
    <from_quantity><![CDATA[1]]></from_quantity>
    <reduction><![CDATA[{discount_percentage:.6f}]]></reduction>
    <reduction_tax><![CDATA[1]]></reduction_tax>
    <reduction_type><![CDATA[percentage]]></reduction_type>
    <from><![CDATA[0000-00-00 00:00:00]]></from>
    <to><![CDATA[0000-00-00 00:00:00]]></to>
</specific_price>
</prestashop>'''
    
    try:
        response = api_client._make_request("POST", "specific_prices", data=specific_price)
    except Exception as e:
        print(f"Error applying discount to product {product_id}: {e}")