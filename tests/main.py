import unittest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.expected_conditions import staleness_of
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from dotenv import load_dotenv
from time import time, sleep
from random import randint
import os

load_dotenv()

class PrestashopTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        download_dir = os.path.join(os.path.dirname(__file__), 'downloads')
        os.makedirs(download_dir, exist_ok=True)
        
        options = Options()
        options.add_experimental_option('detach', True)
        options.add_argument('--unsafely-disable-devtools-self-xss-warnings')
        options.accept_insecure_certs = True
        
        prefs = {
            "download.default_directory": download_dir,
            "download.prompt_for_download": False,
            "download.directory_upgrade": True,
            "safebrowsing.enabled": True
        }
        options.add_experimental_option("prefs", prefs)
        
        cls.browser = webdriver.Chrome(options=options)
        cls.browser.implicitly_wait(10)
        cls.wait = WebDriverWait(cls.browser, 10)
        cls.download_dir = download_dir
    
    @classmethod
    def tearDownClass(cls):
        """Zamknięcie przeglądarki po wszystkich testach"""
        cls.browser.quit()

    def load_product_links(self):
        """Wczytaj linki do produktów z pliku links.txt"""
        links_file = os.path.join(os.path.dirname(__file__), 'links.txt')
        with open(links_file, 'r') as f:
            links = [line.strip() for line in f if line.strip()]
        return links

    # Dodanie 10 produktów (w różnych ilościach) z dwóch różnych kategorii
    def test_1_add_products_to_cart(self):
        """Test dodania produktów z pliku links.txt do koszyka"""
        # Wczytaj linki do produktów
        product_links = self.load_product_links()
        if not product_links:
            self.fail("Brak linków produktów w pliku links.txt")
        
        print(f"\n=== Dodawanie {len(product_links)} produktów do koszyka ===")
        
        products = 1
        for product_url in product_links:
            # Przejdź do strony produktu
            self.browser.get(product_url)
            sleep(1)
            
            value = randint(1, 9)
            self.browser.find_element(by=By.NAME, value='qty').send_keys(Keys.CONTROL + "a")
            self.browser.find_element(by=By.NAME, value='qty').send_keys(str(value))
            self.browser.find_element(by=By.CSS_SELECTOR, value='button.add-to-cart').click()
            sleep(1)
            if products == 10:
              break
            products += 1

    def test_2_add_random_product_to_cart(self):
        self.browser.get("https://localhost:443/szukaj?controller=search&s=buty+terlan")
        sleep(1)
        self.browser.find_element(by=By.CSS_SELECTOR, value='a.product-thumbnail').click()
        sleep(1)
        self.browser.find_element(by=By.CSS_SELECTOR, value='button.add-to-cart').click()
        sleep(1)
    
    def test_3_remove_3_products_from_cart(self):
        self.browser.get("https://localhost:443/koszyk?action=show")
        sleep(1)
        for _ in range(3):
            to_remove = self.browser.find_elements(by=By.CLASS_NAME, value='remove-from-cart')
            if to_remove:
                to_remove[0].click()
                sleep(1)

    def test_4_register(self):
        self.browser.get("https://localhost:443/logowanie?create_account=1")
        sleep(1)
        self.browser.find_element(by=By.ID, value='field-id_gender-1').click()
        self.browser.find_element(by=By.ID, value='field-firstname').send_keys('Test')
        self.browser.find_element(by=By.ID, value='field-lastname').send_keys('User')
        self.browser.find_element(by=By.ID, value='field-email').send_keys('skykuba0@gmail.com')
        self.browser.find_element(by=By.ID, value='field-password').send_keys('TestPassword123')
        self.browser.find_element(by=By.NAME, value='customer_privacy').click()
        self.browser.find_element(by=By.NAME, value='psgdpr').click()
        self.browser.find_element(by=By.CSS_SELECTOR, value='button.btn-primary').click()
        sleep(2)

    def test_5_checkout(self):
        self.browser.get("https://localhost:443/koszyk?action=show")
        sleep(2)
        self.browser.find_element(by=By.CSS_SELECTOR, value='a.btn-primary').click()
        sleep(2)
        self.browser.find_element(by=By.ID, value='field-address1').send_keys('Hynka 126')
        self.browser.find_element(by=By.ID, value='field-postcode').send_keys('80-251')
        self.browser.find_element(by=By.ID, value='field-city').send_keys('Gdańsk')
        sleep(2)
        self.browser.find_element(by=By.NAME, value='confirm-addresses').click()
        sleep(2)
        self.browser.find_element(by=By.NAME, value='confirmDeliveryOption').click()
        sleep(2)
        self.browser.find_element(by=By.ID, value='payment-option-2').click()
        sleep(1)
        self.browser.find_element(by=By.NAME, value='conditions_to_approve[terms-and-conditions]').click()
        self.browser.find_element(by=By.CSS_SELECTOR, value='button.btn-primary').click()
    
    def test_6_status_order(self):
        self.browser.get("https://localhost:443/historia-zamowien")
        sleep(1)
        status = self.browser.find_element(by=By.CSS_SELECTOR, value='span.label.label-pill').text
        print(f"Status zamówienia: {status}")

    def test_7_download_invoice(self):
        self.browser.get("https://localhost:443/historia-zamowien")
        sleep(1)
        self.browser.find_element(by=By.CSS_SELECTOR, value='td.text-sm-center').click()
        sleep(5)

if __name__ == '__main__':
    unittest.main(verbosity=2)
