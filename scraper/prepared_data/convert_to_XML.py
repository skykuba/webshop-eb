"""Convert JSON data structures to PrestaShop XML format."""

import xml.etree.ElementTree as ET


def dict_to_xml(parent, data):
    """Recursively convert a dictionary to XML elements."""
    if isinstance(data, dict):
        for key, value in data.items():
            if isinstance(value, list):
                # Special handling for language fields
                if key == "language":
                    for item in value:
                        if isinstance(item, dict) and "id" in item and "value" in item:
                            # PrestaShop language format (CDATA added later)
                            lang_elem = ET.SubElement(parent, key)
                            lang_elem.set("id", str(item["id"]))
                            lang_elem.text = str(item['value'])
                        else:
                            # Regular list item
                            child = ET.SubElement(parent, key)
                            dict_to_xml(child, item)
                else:
                    # Handle regular lists - create multiple elements with the same tag
                    for item in value:
                        child = ET.SubElement(parent, key)
                        dict_to_xml(child, item)
            elif isinstance(value, dict):
                # Handle nested dictionaries
                child = ET.SubElement(parent, key)
                dict_to_xml(child, value)
            else:
                # Handle simple values (CDATA added later)
                child = ET.SubElement(parent, key)
                child.text = str(value) if value is not None else ""
    else:
        # If data is not a dict, set it as text content (CDATA added later)
        parent.text = str(data) if data is not None else ""


def json_to_xml(data):
    """Convert JSON (dict) to PrestaShop XML format."""
    import re
    
    # Create root element (prestashop)
    root = ET.Element("prestashop")
    root.set("xmlns:xlink", "http://www.w3.org/1999/xlink")
    
    # Convert the dictionary to XML
    dict_to_xml(root, data)
    
    # Get XML string
    xml_string = ET.tostring(root, encoding='unicode')
    
    # Add CDATA sections using regex (after XML is generated)
    # For language tags
    xml_string = re.sub(
        r'<language id="(\d+)">([^<]*)</language>',
        r'<language id="\1"><![CDATA[\2]]></language>',
        xml_string
    )
    
    return xml_string