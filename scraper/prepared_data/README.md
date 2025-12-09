# Product Data Selection

## Requirements
- **4 categories** with **2 subcategories** each
- Minimum **1000 products** in total
- Each product must have **at least 2 photos**

---

## Selected Categories and Subcategories

### Podróże i trekking
| Subcategory | Products |
|-------------|----------|
| kuchnia turystyczna | 193 |
| plecaki | 506 |
| **Total** | **699** |

### Buty *(sized products)*
| Subcategory | Products |
|-------------|----------|
| męskie | 183 |
| damskie | 139 |
| **Total** | **322** |

### Wspinaczka
| Subcategory | Products |
|-------------|----------|
| przyrządy | 31 |
| raki i raczki | 31 |
| woreczki i magnezja | 32 |
| via ferrata | 73 |
| karabinki i ekspresy | 18 |
| liny, taśmy i repy | 8 |
| lawinowe ABC | 2 |
| **Total** | **195** |

### Skitour
| Subcategory | Products |
|-------------|----------|
| foki i akcesoria | 10 |
| wiązania i akcesoria | 13 |
| **Total** | **23** |

---

## Summary
**TOTAL PRODUCTS: 1239**

---

## Project Structure

### Main Files

- **`prepare_data.py`** - Main script that prepares data and posts all products to PrestaShop
- **`config.py`** - Configuration constants (categories, sizes, file paths)
- **`categories_handler.py`** - Handles category creation in PrestaShop API
- **`products_handler.py`** - Product data loading, filtering, preparation, and posting
- **`photos_handler.py`** - Copies product photos to prepared data directory and post photos for products
- **`combinations_handler.py`** - Generates size combinations for shoes with random availability
- **`attributes_handler.py`** - Creates attribute groups and size attributes in PrestaShop
- **`discount_handler.py`** - Applies discounts using PrestaShop specific_prices

---

## Prerequisites

### 1. Product Photos

Product photos must be available in the `scraper/data/photos/` directory.

**Download photos from:** https://www.mediafire.com/folder/3n4hx1qth33nx/BE_zdjęcia

#### Move photos.zip from Downloads to project:

**Note:** Run these commands from the project root directory (`webshop-eb/`)

**Windows (PowerShell):**
```powershell
Move-Item -Path "$env:USERPROFILE\Downloads\photos.zip" -Destination ".\scraper\data\"
```

**Linux/Mac:**
```bash
mv ~/Downloads/photos.zip ./scraper/data/
```

#### Extract photos.zip:

**Windows (PowerShell):**
```powershell
Expand-Archive -Path ".\scraper\data\photos.zip" -DestinationPath ".\scraper\data\" -Force
```

**Linux/Mac:**
```bash
unzip ./scraper/data/photos.zip -d ./scraper/data/
```

### 2. Scraped Data

Ensure the following files exist in `scraper/data/`:
- `products.json` - Scraped product data
- `categories.json` - Scraped category structure

---

## Usage

Run the main preparation script from the project root directory:

**Windows (PowerShell):**
```powershell
cd .\scraper\prepared_data
python prepare_data.py
```

**Linux/Mac:**
```bash
cd ./scraper/prepared_data
python prepare_data.py
```

### What the script does:

1. **Loads data** - Products and categories from JSON files
2. **Initializes API** - Connects to PrestaShop REST API
3. **Creates categories** - Posts category hierarchy to PrestaShop
4. **Creates size attributes** - Sets up size groups for shoes (38-45)
5. **Processes products** - For each product:
   - Prepares data (price conversion, HTML cleaning)
   - Parse products to XML
   - Sets random quantity for products (0 or 3-10)
   - Applies random discount (10% chance, 5-60% off)
   - Posts to PrestaShop
   - Copies photos (max 2 per product)
   - Generates size combinations for shoes (with random availability)

---