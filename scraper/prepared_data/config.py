"""Configuration constants for data preparation."""

from typing import List
import os

# Categories and subcategories to include
WANTED_CATEGORIES: List[str] = [
    "podróże i trekking",
    "buty",
    "wspinaczka",
    "skitour"
]

WANTED_SUBCATEGORIES: List[str] = [
    # Podróże i trekking
    "plecaki",
    "kuchnia turystyczna",
    # Buty
    "męskie",
    "damskie",
    # Wspinaczka
    "przyrządy",
    "raki i raczki",
    "woreczki i magnezja",
    "via ferrata",
    "karabinki i ekspresy",
    "liny, taśmy i repy",
    "lawinowe ABC",
    # Skitour
    "foki i akcesoria",
    "wiązania i akcesoria"
]

# Categories that require size combinations
SIZE_CATEGORIES: List[str] = ["buty"]

# Available shoe sizes
SHOE_SIZES: List[int] = [38, 39, 40, 41, 42, 43, 44, 45]

# File paths
SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
CATEGORIES_FILE: str = os.path.join(SCRIPT_DIR, "../data/categories.json")
INPUT_DATA_FILE: str = os.path.join(SCRIPT_DIR, "../data/products.json")
OUTPUT_DATA_FILE: str = os.path.join(SCRIPT_DIR, "prepared_products.json")
PHOTOS_OUTPUT_DIR: str = os.path.join(SCRIPT_DIR, "photos")
