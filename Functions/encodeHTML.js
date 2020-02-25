/*
** Encodes a text string into ASCII HTML-safe markup by replacing reserved
** markup characters and non-ASCII characters by numeric character references
** and character entity references.
** 
** This encoding is similar to Server.HTMLEncode method in Classic ASP:
** https://docs.microsoft.com/previous-versions/iis/6.0-sdk/ms525347%28v%3dvs.90%29
** 
** Philippe Majerus, February 2020
*/


function encodeHTML (text) {
	var entity = {
		60 /* < */: "&lt;",
		62 /* > */: "&gt;",
		38 /* & */: "&amp;",
		34 /* " */: "&quot;"
	};
	var sb = new Array();
	for (var i = 0; i < text.length; i++) {
		var c = text.charCodeAt(i);
		// Combine any UTF-16 surrogate pair
		if ((c >= 0xD800) && (c <= 0xDBFF)) {
			var c2 = text.charCodeAt(++i);
			if (!((c2 >= 0xDC00) && (c2 <= 0xDFFF))) {
				// High surrogate without low surrogate
				var e = new TypeError("The text to be encoded contains an invalid character");
				e.description = e.message;
				throw e;
			}
			c = 0x10000 + ((c - 0xD800) << 10) + (c2 - 0xDC00);
		} else if ((c >= 0xDC00) && (c <= 0xDFFF)) {
			// Low surrogate without high surrogate before it
			var e = new TypeError("The text to be encoded contains an invalid character");
			e.description = e.message;
			throw e;
		}
		
		var e = entity[c];
		if (e !== undefined) {
			sb.push(e);
		} else if (c >= 128) {
			sb.push("&#"+ c +";");
		} else {
			sb.push(text.charAt(i));
		}
	}
	return sb.join("");
}
