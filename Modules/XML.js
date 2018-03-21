/****************************************************************************
** XML.js  (JScript Module)
** 
** This module can encode objects and arrays, including embedded
** sub-objects and sub-arrays, into an XML document.
** 
** - Philippe Majerus, February 2018.
** 
****************************************************************************/

// Encodes an object and all its sub-objects into an XML document.
function encode(object, name) {
	if (name === undefined)
		name = "root";
	
	var xmldoc;
	// Use MSXML (Microsoft Core XML Services) 6.0
	// It is included in Windows Vista and later, and installable on 2000, XP and 2003.
	try {
		xmldoc = new ActiveXObject("MSXML2.DOMDocument.6.0");
	} catch(ex) {
		if (ex.number == -2146827859)
			ex.description = "Microsoft Core XML Services (MSXML) 6.0 are not available";
		throw ex;
	}
	
	function serializeElement(parentElement, name, object) {
		var child = xmldoc.createElement(name);
		if (Array.isArray(object)) {
			for (var i = 0; i < object.length; i++) {
				serializeElement(child, "item", object[i]);
			}		
		} else {
			if (typeof object === "object") {
				for (var prop in object) {
					if (object.hasOwnProperty(prop)) {
						// property as child object
						serializeElement(child, prop, object[prop]);
					}
				}
			} else {
				// property as primitive type
				child.text = object.toString();
			}
		}
		parentElement.appendChild(child);
	}
	
	serializeElement(xmldoc, name, object);	
	return xmldoc.xml;
}
