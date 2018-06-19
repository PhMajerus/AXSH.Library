/*
** This provides a way to convert a string into a literal for use in
** JavaScript source code.
** 
** This function escapes every character not part of the common low-ASCII
** characters set. This makes sure the literal can be used in plain ANSI
** script files, where high-ASCII depends on computer's current locale.
** 
** The literal is returned with enclosing double quotes, single quotes are
** not escaped.
** See comments in source if you need single-quotes-enclosed strings.
** 
** This is designed to make it easy to convert text from an existing string,
** or imported from another format, into a literal ready to embed in your
** .js files or eval.
** This differs from JSON.stringify because JSON is more restrictive in
** escape sequences supported, forcing all C0 control characters to use their
** full Unicode representation, but also tolerate lots of UTF-8 characters,
** which isn't safe for use in plain ASCII and ANSI files.
** JavaScript code in AXSH and WSH is typically stored in localized text
** files, and therefore require escaping all codepage-dependent characters.
** 
** - Philippe Majerus, May 9, 2018
*/

"use strict";

function stringToLiteral(string) {
	var meta = {
		0: "\\0", // null character
		8: "\\b", // backspace
		9: "\\t", // tab
		10: "\\n", // new line
		// 11: "\\v", // vertical tab // JScript 5 doesn't handle \v properly, let it get escaped as \x0B
		12: "\\f", // form feed
		13: "\\r", // carriage return
		34: "\\\"", // comment line to avoid escaping double quotes character
		// 39: "\\'", // uncomment line to escape single quotes character as well
		92: "\\\\" // backslash character
	};
	
	var literal = new Array();
	for (var i = 0; i < string.length; i++) {
		var c = string.charCodeAt(i);
		var m = meta[c];
		if (m !== undefined) {
			// char has a meta available for it
			literal.push(m);
		} else if ((c>=32) && (c<=126)) {
			// char is a base ASCII character, use character as it
			literal.push(string.charAt(i));
		} else if (c <= 255) {
			// char is a control or high-ASCII character, use Latin-1 character form
			literal.push("\\x" + ("00" + c.toString(16).toUpperCase()).slice(-2) );
		} else {
			// char is another character, use Unicode codepoint form
			literal.push("\\u" + ("0000" + c.toString(16).toUpperCase()).slice(-4) );
		}
	}
	
	return "\"" + literal.join("") +"\"";
}
