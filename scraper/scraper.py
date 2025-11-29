''' imports for site scraping '''
from bs4 import BeautifulSoup
import requests

''' imports for json handling '''
import json
import os

''' imports for multithreading '''
from concurrent.futures import ThreadPoolExecutor, as_completed
import threading
local_thread = threading.local()

def init_thread(worker_id):
    local_thread.worker_id = worker_id

class Node:
    def __init__(self, name, link, parent=None):
        self.name = name
        self.link = link
        self.children = []
        self.parent = parent

    def add_child(self, child_node):
        self.children.append(child_node)
    
    def print_tree(self, level=0):
        print('-' * (level-1) + f"- {self.name} ({self.link})")
        for child in self.children:
            child.print_tree(level + 1)

class Item:
    def __init__(self, name, short_description, long_description, link, price, brand, parameters, thumbnail=None, photos=None, parent=None):
        self.name = name
        self.short_description = short_description
        self.long_description = long_description
        self.link = link
        self.price = price
        self.brand = brand
        self.parameters = parameters # dictionary of parameters
        self.thumbnail = thumbnail #link to photo which is used as thumbnail
        self.photos = photos # list of full resolution photos names
        self.parent = parent
    
    def add_parameter(self, key, value):
        self.parameters[key] = value

#-------------------------------------------------
#                  Tree functions
#-------------------------------------------------

def add_children(parent_node, menu):
    for item in menu:
        link = item.find('a', class_='nav-link')
        child_node = Node(link.text.strip(), link.get('href'), parent_node) if link else Node("No link", None, parent_node)
        parent_node.add_child(child_node)
        if item.find('ul') is not None:
            add_children(child_node, item.find('ul'))

def build_tree(session):
    page = session.get("https://www.tuttu.pl/")
    soup = BeautifulSoup(page.content, "html.parser")
    root = Node("Root", None)
    menu = soup.find('ul', class_='navbar-nav')
    add_children(root, menu)
    return root

def get_leaf_nodes(node):
    leaves = []
    for child in node.children:
        if not child.children:
            leaves.append(child)
        else:
            leaves.extend(get_leaf_nodes(child))
    return leaves

def save_categories(node, filename='data/categories.txt'):
    with open(filename, 'w', encoding='utf-8') as file:
        recursive_save_categories(node, file)

def recursive_save_categories(node, file, level=0):
    if level > 0:
        file.write("-" * (level-1) + f"{node.name} ({node.link})\n")
        for child in node.children:
            recursive_save_categories(child, file, level + 1)
    else:
        for child in node.children:
            recursive_save_categories(child, file, level + 1)
#-------------------------------------------------
#                  Item functions
#-------------------------------------------------

def full_url(link):
    if not link:
        return None
    if not link.startswith('/'):
        link = '/' + link
    return "https://www.tuttu.pl" + link

def all_items(leaves, session):
    for leaf in leaves:
        category_items(leaf, session)

def category_items(node, session):
    subsubcategory_link = full_url(node.link)

    if subsubcategory_link is None:
        return
    
    page = session.get(subsubcategory_link)
    soup = BeautifulSoup(page.content, "html.parser")

    items = soup.find_all('div', class_='product col-6 col-sm-4 col-xl-3 pt-3 pb-md-3')
    if items:
        links = [item.find('a', class_='product__name').get('href') for item in items]
        IDs = list(range(1, 11))
        with ThreadPoolExecutor(max_workers=10, initializer= lambda: init_thread(IDs.pop(0))) as executor:
            tasks = [executor.submit(scrap_item, node, link, session) for link in links]
            for task in as_completed(tasks):
                try:
                    task.result()
                except Exception as e:
                    print(f"Error scraping: {e}")

def scrap_item(node, item_link, session):             
    page = session.get(item_link)
    soup = BeautifulSoup(page.content, "html.parser")
    
    ''' All item details '''
    name = soup.find('span', class_='headline__name --secondary_headline_name')
    name = name.text.strip() if name else "None"
    short_description = soup.find('div', class_='product_name__block --description mt-3')
    short_description = short_description.text.strip() if short_description else "None"
    long_description = str(soup.find('section', id='projector_longdescription')) #must be saved as html
    price = soup.find('strong', class_='projector_prices__price')
    price = price.text.strip() if price else "None"
    brand = soup.find('span', class_='firm_logo_name')
    brand = brand.text.strip() if brand else "None"
    imgs = [img.get('data-img_high_res') for img in soup.find('div', class_='photos___slider_wrapper swiper-wrapper').find_all('img', class_="photos__photo")]
    thumbnail = imgs[0]
    parameters = {}

    parameters_table = soup.find('div', class_='dictionary')
    if parameters_table:
        keys = parameters_table.find_all('div', class_='dictionary__name')
        values = parameters_table.find_all('div', class_='dictionary__values')
    if parameters_table and len(keys) == len(values):
        for key, value in zip(keys, values):
            parameters[key.text.strip()] = value.text.strip()

    new_item = Item(name, short_description, long_description, item_link, price, brand, parameters, thumbnail, imgs, node)

    export_item_to_jsonl(new_item)

#-------------------------------------------------
#               Image functions
#-------------------------------------------------

def download_img_from_json(filename='data/products.json'):
    img_links = set()
    with open(filename, 'r', encoding='utf-8') as file:
        items = json.load(file)
        for item in items:
            if item['photos']:
                img_links.update(item['photos'])
    download_images(list(img_links))

#not using multithreading because site blocks it
def download_images(img_links):
    for img_link in img_links:
        if os.path.exists(f'data/photos/{img_link.split("/")[-1]}'):
            continue
        img_link = "https://www.tuttu.pl" + img_link
        img_data = requests.get(img_link).content
        with open(f'data/photos/{img_link.split("/")[-1]}', 'wb') as handler:
            handler.write(img_data)

#-------------------------------------------------
#               Json functions
#-------------------------------------------------

def export_item_to_jsonl(item, base_filename='data/products'):
    worker_id = getattr(local_thread, 'worker_id', 'indentified')
    filename = f'{base_filename}_{worker_id}.jsonl'
    item_dict = {
        'name': item.name,
        'short_description': item.short_description,
        'long_description': item.long_description,
        'link': item.link,
        'price': item.price,
        'brand': item.brand,
        'parameters': item.parameters,
        'thumbnail': item.thumbnail,
        'photos': item.photos,
        'category': item.parent.parent.parent.name if item.parent and item.parent.parent and item.parent.parent.parent else None,
        'subcategory': item.parent.parent.name if item.parent and item.parent.parent else None,
        'subsubcategory': item.parent.name if item.parent else None
    }

    with open(filename, 'a', encoding='utf-8') as file:
        json.dump(item_dict, file, ensure_ascii=False)
        file.write('\n')

def merge_jsonl_files(output_filename='data/products.jsonl', folder='data'):
    with open(output_filename, 'w', encoding='utf-8') as file:
        for thread_file in os.listdir(folder):
            if thread_file.startswith('products_'):
                with open(os.path.join(folder, thread_file), 'r', encoding='utf-8') as source:
                    for line in source:
                        file.write(line)
    jsonl_to_json()

def jsonl_to_json(filename='data/products.jsonl', output_filename='data/products.json'):
    items = []
    with open(filename, 'r', encoding='utf-8') as file:
        for line in file:
            items.append(json.loads(line))
    with open(output_filename, 'w', encoding='utf-8') as file:
        json.dump(items, file, ensure_ascii=False, indent=4)
    delete_jsonl_files()

def delete_jsonl_files(folder='data'):
    for file in os.listdir(folder):
        if file.startswith('products_'):
            os.remove(os.path.join(folder, file))
    os.remove(os.path.join(folder, 'products.jsonl'))

if __name__ == "__main__":
    session = requests.Session()
    root = build_tree(session)
    save_categories(root)
    all_items(get_leaf_nodes(root), session)
    merge_jsonl_files()
    download_img_from_json()