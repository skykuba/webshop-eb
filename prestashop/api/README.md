# PrestaShop API Client

A simple client for communicating with the PrestaShop 1.7.8.x REST API

## Installation

```bash
pip install -r requirements.txt
```

## Configuration

Create a `.env.dev` file in the parent directory (`prestashop/.env.dev`):

```
API_KEY=your_api_key_here
```

You can get your API key from the PrestaShop admin dashboard: **Advanced Parameters > Webservice**

In polish verstion:
**Zaawansowane > API**

You need to enable prestashop API

## Usage

```python
from prestashop_api import PrestaShopAPIClient

# Initialize client
client = PrestaShopAPIClient(
    base_url="https://your-prestashop-url.com",
    # ws_key="optional_api_key"  # if not set in .env.dev
)

# Get product
product = client.get_product(14)
print(product)
```

## API

### `PrestaShopAPIClient(base_url, ws_key, verify_ssl, timeout)`

**Parameters:**
- `base_url` (str): PrestaShop URL (default: `https://localhost`)
- `ws_key` (str, optional): API Key (loaded from `.env.dev` if not provided)
- `verify_ssl` (bool): SSL verification (default: `False`)
- `timeout` (int): Request timeout in seconds (default: `10`)


## Requirements

- `requests>=2.28.0` - HTTP communication
- `python-dotenv>=0.20.0` - Load environment variables from file
- `urllib3>=1.26.0` - Requests dependency (SSL/TLS support)

## Example

Run `examples.py`:

```bash
python examples.py
```
