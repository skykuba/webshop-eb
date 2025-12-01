import json
from prestashop_api import PrestaShopAPIClient

try:
    # Initialize client
    client = PrestaShopAPIClient()
    print("Connected to PrestaShop API\n")
    
    print("Fetching product ID: 14...")
    product = client.get_product(14)
    
    print("\n" + "=" * 60)
    print("PRODUCT:")
    print("=" * 60)
    print(json.dumps(product, indent=2, ensure_ascii=False))
    print("=" * 60)
    
except Exception as e:
    print(f"Connection error: {e}")  