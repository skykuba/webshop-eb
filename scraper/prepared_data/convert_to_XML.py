"""Convert JSON data structures to PrestaShop XML format."""

import xml.etree.ElementTree as ET
from xml.dom import minidom


def dict_to_xml(parent, data):
    """
    Recursively convert a dictionary to XML elements.
    
    Special handling for 'language' fields in PrestaShop format:
    Input: {"language": [{"id": 1, "value": "Text"}]}
    Output: <language id="1"><![CDATA[Text]]></language>
    """
    if isinstance(data, dict):
        for key, value in data.items():
            if isinstance(value, list):
                # Special handling for language fields
                if key == "language":
                    for item in value:
                        if isinstance(item, dict) and "id" in item and "value" in item:
                            # PrestaShop language format
                            lang_elem = ET.SubElement(parent, key)
                            lang_elem.set("id", str(item["id"]))
                            lang_elem.text = item["value"]
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
                # Handle simple values
                child = ET.SubElement(parent, key)
                child.text = str(value) if value is not None else ""
    else:
        # If data is not a dict, set it as text content
        parent.text = str(data) if data is not None else ""


def prettify_xml(elem):
    """ Return a pretty-printed XML string for the Element with CDATA preserved. """
    rough_string = ET.tostring(elem, encoding='utf-8').decode('utf-8')
    
    # Don't use minidom as it escapes CDATA
    # Instead, manually add CDATA sections where needed
    import re
    
    # Wrap text content in CDATA for specific tags
    def add_cdata(match):
        tag = match.group(1)
        content = match.group(2)
        # Skip empty content or already has CDATA
        if not content or content.strip() == '' or '<![CDATA[' in content:
            return match.group(0)
        # Add CDATA wrapper
        return f'<{tag}><![CDATA[{content}]]></{tag.split()[0]}>'
    
    # Add CDATA to language tags
    rough_string = re.sub(r'<(language[^>]*)>([^<]+)</language>', add_cdata, rough_string)
    
    # Pretty print manually
    from xml.dom import minidom
    try:
        reparsed = minidom.parseString(rough_string.encode('utf-8'))
        pretty = reparsed.toprettyxml(indent="  ", encoding='utf-8').decode('utf-8')
        return pretty
    except:
        # If parsing fails, return without prettifying
        return rough_string


def json_to_xml(data):
    """ Convert JSON (dict) to PrestaShop XML format. """
    # Create root element (prestashop)
    root = ET.Element("prestashop")
    root.set("xmlns:xlink", "http://www.w3.org/1999/xlink")
    
    # Convert the dictionary to XML
    dict_to_xml(root, data)
    
    return prettify_xml(root)