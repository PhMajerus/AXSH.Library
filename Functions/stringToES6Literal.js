/*
** This provides a way to convert a string into an ES6 Unicode literal.
** 
** It is almost identical to the stringToLiteral function, but takes
** advantage of ECMAScript 2015 (ES6) Code point escape sequences to
** represent Unicode character outside of the BMP without using two
** UTF-16 surrogates.
** 
** This is incompatible with JScript 5 source code, which is limited to ES3
** literals, but convenient to create literals for other JavaScript engines.
** It is used for example if your script is generating script for a browser.
*/


function stringToES6Literal(string, encloseInSingleQuotes) {
	var meta = {
		0: "\\0", // null character
		8: "\\b", // backspace
		9: "\\t", // tab
		10: "\\n", // new line
		11: "\\v", // vertical tab
		12: "\\f", // form feed
		13: "\\r", // carriage return
		92: "\\\\" // backslash character
	};
	var enclosingQuotes;
	if (encloseInSingleQuotes) {
		// Escape single quotes characters
		meta[39] = "\\'";
		enclosingQuotes = "'";
	} else {
		// Escape double quotes characters
		meta[34] = "\\\"";
		enclosingQuotes = "\"";
	}
	
	var literal = new Array();
	for (var i = 0; i < string.length; i++) {
		var c = string.charCodeAt(i);
		var m = meta[c];
		if (m !== undefined) {
			// Char has a meta available for it
			literal.push(m);
		} else if ((c>=32) && (c<=126)) {
			// Char is a base ASCII character, use character as it
			literal.push(string.charAt(i));
		} else if (c <= 255) {
			// Char is a control or high-ASCII character, use Latin-1 character form
			literal.push("\\x" + ("00" + c.toString(16).toUpperCase()).slice(-2) );
		} else if ((c >= 0xD800) && (c <= 0xDBFF)) {
			// High surrogate, fetch low surrogate
			i++;
			var c2 = string.charCodeAt(i);
			if ((i >= string.length) || (c2 <= 0xDC00) || (c2 >= 0xDFFF)) {
				// High surrogate without low surrogate, invalid
				throw new Error("String contains invalid UTF-16 surrogates.");
			}
			// Char is a non-BMP Unicode character, use code point escape sequence
			literal.push("\\u{" + (((c-0xD800)*0x400+(c2-0xDC00)+0x10000)).toString(16).toUpperCase() + "}");
		} else if ((c >= 0xDC00) && (c <= 0xDFFF)) {
			// Low surrogate without high surrogate, invalid
			throw new Error("String contains invalid UTF-16 surrogates.");
		} else {
			// Char is another character, use shorter BMP-only Unicode escape sequence
			literal.push("\\u" + ("0000" + c.toString(16).toUpperCase()).slice(-4) );
		}
	}
	
	return enclosingQuotes + literal.join("") + enclosingQuotes;
}
