import os
import requests
import warnings
from typing import Dict, Optional, Any
from urllib.parse import urljoin
from dotenv import load_dotenv
from urllib3.exceptions import InsecureRequestWarning

# Disable SSL warnings for self-signed certificates
warnings.filterwarnings('ignore', category=InsecureRequestWarning)

class PrestaShopAPIClient:
    """API Client for PrestaShop 1.7.8.x"""

    def __init__(
        self,
        base_url: str = "https://localhost",
        ws_key: Optional[str] = None,
        verify_ssl: bool = False,
        timeout: int = 10,
    ):
        """
        Initialize PrestaShop API Client

        Args:
            base_url: PrestaShop base URL (default: https://localhost)
            ws_key: WebService Key (if None, loads from .env.dev)
            verify_ssl: SSL verification (default: False)
            timeout: Request timeout in seconds
        """
        self.base_url = base_url.rstrip("/")
        self.verify_ssl = verify_ssl
        self.timeout = timeout

        # Load ws_key from .env.dev if not provided
        if ws_key is None:
            # Get the directory where this file is located
            current_dir = os.path.dirname(os.path.abspath(__file__))
            env_path = os.path.join(current_dir, "../.env.dev")
            load_dotenv(env_path)
            ws_key = os.getenv("API_KEY")

        if not ws_key:
            raise ValueError("API_KEY not found. Set it in .env.dev or pass as argument")

        self.ws_key = ws_key

    def _build_url(self, endpoint: str) -> str:
        """Build full URL for endpoint"""
        return urljoin(f"{self.base_url}/", f"api/{endpoint}")

    def _make_request(
        self,
        method: str,
        endpoint: str,
        data: Optional[str] = None,
        params: Optional[Dict[str, Any]] = None,
    ) -> Dict[str, Any]:
        """
        Make request to API

        Args:
            method: HTTP method (GET, POST, PUT, DELETE)
            endpoint: API endpoint (e.g., 'products')
            data: XML string to send
            params: Query parameters

        Returns:
            Response as dictionary (JSON)
        """
        url = self._build_url(endpoint)

        # Add ws_key to parameters
        if params is None:
            params = {}
        params["ws_key"] = self.ws_key
        params["output_format"] = "JSON"
        
        # Prepare headers and data
        headers = {}
        request_data = None
        
        if data is not None:
            headers["Content-Type"] = "application/xml"
            request_data = data.encode('utf-8')

        try:
            response = requests.request(
                method=method,
                url=url,
                data=request_data,
                params=params,
                headers=headers,
                verify=self.verify_ssl,
                timeout=self.timeout,
            )
            response.raise_for_status()
            
            # DELETE requests often return empty response
            if method == "DELETE" or not response.text:
                return {}
            
            return response.json()
        except requests.exceptions.HTTPError as e:
            print(f"HTTP Error: {e.response.status_code}")
            print(f"Response: {e.response.text}")
            raise
        except requests.exceptions.RequestException as e:
            print(f"Request Error: {e}")
            raise
        
    def get_product(self, product_id: int) -> Dict[str, Any]:
        """Get product by ID"""
        return self._make_request("GET", f"products/{product_id}")