"""Convert JSON data structures to PrestaShop XML format."""

import xml.etree.ElementTree as ET
from xml.dom import minidom


def dict_to_xml(parent, data):
    """ Recursively convert a dictionary to XML elements. """
    if isinstance(data, dict):
        for key, value in data.items():
            if isinstance(value, list):
                # Handle lists - create multiple elements with the same tag
                for item in value:
                    child = ET.SubElement(parent, key)
                    dict_to_xml(child, item)
            elif isinstance(value, dict):
                # Handle nested dictionaries
                child = ET.SubElement(parent, key)
                dict_to_xml(child, value)
            else:
                # Handle simple values
                child = ET.SubElement(parent, key)
                child.text = str(value) if value is not None else ""
    else:
        # If data is not a dict, set it as text content
        parent.text = str(data) if data is not None else ""


def prettify_xml(elem):
    """ Return a pretty-printed XML string for the Element. """
    rough_string = ET.tostring(elem, encoding='utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ", encoding='utf-8').decode('utf-8')


def json_to_xml(data):
    """ Convert JSON (dict) to PrestaShop XML format. """
    # Create root element (prestashop)
    root = ET.Element("prestashop")
    root.set("xmlns:xlink", "http://www.w3.org/1999/xlink")
    
    # Convert the dictionary to XML
    dict_to_xml(root, data)
    
    return prettify_xml(root)