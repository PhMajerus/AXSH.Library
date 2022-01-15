/*
** Parses an ES6 string literal.
** 
** JScript does not support ES6 Unicode literals. This function can be used
** to parse them manually.
** By default, it handles octal escape sequences, but passing true as the
** second arguments enables strict mode which then throws an error if an
** octal escape sequence is encountered.
*/


function ES6LiteralToString(literal/*, useStrict*/) {
	var useStrict = Boolean(arguments[1]);
	
	var meta = {
		'b': '\b',   // backspace
		't': '\t',   // tab
		'n': '\n',   // new line
		'v': '\x0B', // vertical tab // JScript 5 doesn't handle \v properly.
		'f': '\f',   // form feed
		'r': '\r'    // carriage return
		// "\0" is handled by octal handler, "\\" is handled by default next-char handler.
	};
	
	// Handle enclosing single or double quotes
	var l = /^(["'])(.*)(\1)$/.exec(literal);
	if (null === l) {
		throw new Error("String literal is missing enclosing single or double quotes.");
	}
	l = l[2];
	
	// Handle all escape sequences at once
	//                [ Unicode code point  ] [ BMP code point  ] [ Latin1 charcode ] [ octal char escape sequence ] [esc]
	return l.replace(/\\u{([0-9A-Fa-f]{1,6})}|\\u([0-9A-Fa-f]{4})|\\x([0-9A-Fa-f]{2})|\\(3[0-7]{2}|[0-2]?[0-7]{1,2})|\\(.)/g, function(match,codepoint,codeunit,charcode,octal,char) {
		if (codepoint) {
			// Handle ES6 Unicode code point escape sequences
			var cp = parseInt(codepoint, 16);
			if ((cp > 0x10FFFF) || (cp < 0)) {
				throw new Error("Undefined Unicode code-point in escape sequence");
			} else if (cp < 0x10000) {
				return String.fromCharCode(cp);
			} else {
				cp -= 0x10000
				var h = 0xD800 + (cp >> 10);
				var l = 0xDC00 + (cp & 0x3FF);
				return String.fromCharCode(h,l);
			}
		} else if (codeunit) {
			// Handle Unicode BMP code points (or UTF-16 code units) escape sequences
			var cu = parseInt(codeunit, 16);
			return String.fromCharCode(cu);
		} else if (charcode) {
			// Handle Latin-1 escape sequences
			var cc = parseInt(charcode, 16);
			return String.fromCharCode(cc);
		} else if (octal) {
			// Handle octal escape sequence
			var cc = parseInt(octal, 8);
			if (useStrict && (cc!==0)) {
				throw new Error("Octal escape sequences are not allowed");
			}
			return String.fromCharCode(cc);
		} else { // char
			// Handle escape sequences
			var m = meta[char];
			if (m !== undefined) {
				return m;
			}
			// Character as it
			return char;
		}
	});
}
