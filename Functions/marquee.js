/*
** Converts a single line of text into an animated marquee string.
** 
** This function returns a string with ActiveScript Shell-specific control
** characters to handle animation. When output using AXSH.echo, it will show
** the text scrolling like a marquee.
** 
** Sample usage:
** echo(marquee("*** This is a simple marquee test! ***", 10, "-=]", "[=-"));
*/


function marquee (text, width, prefix, suffix) {
	var sText = String(text);
	var reCtrlChar = /[\x00-\x1F\x7F\x80-\x9F]/;
	if (reCtrlChar.test(sText)) {
		var e = new TypeError("Marquee text cannot contain control characters");
		e.description = e.message;
		throw e;
	}
	var w = width!==undefined ? Math.floor(Number(width)) : 10
	if (w < 0) {
		var e = new TypeError("Marquee width must be a positive number");
		e.description = e.message;
		throw e;
	}
	var sPrefix = "";
	if (prefix) {
		sPrefix = String(prefix);
		if (reCtrlChar.test(sPrefix)) {
			var e = new TypeError("Marquee prefix cannot contain control characters");
			e.description = e.message;
			throw e;
		}
	}
	var sSuffix = "";
	if (suffix) {
		sSuffix = String(suffix);
		if (reCtrlChar.test(sSuffix)) {
			var e = new TypeError("Marquee suffix cannot contain control characters");
			e.description = e.message;
			throw e;
		}
	}
	
	var s = "";
	
	// Hide cursor
	s += "\x1B[?25l";
	
	// Add prefix
	s += sPrefix;
	
	// Animate marquee
	var l = sText.length;
	// Add empty marquee frame
	s+= '\xA0'.repeat(w);
	for (var o = -w; o <= l; o++) {
		// Add marquee frame
		var offsetText = o<0 ? 0 : o;
		var ccLead = o<0 ? -o : 0;
		var ccTrail = (l-o)<w ? w-(l-o) : 0;
		s+= (sText.substr(offsetText, w-ccLead) + '\xA0'.repeat(ccTrail));
		
		// Add suffix
		s+= sSuffix;
		
		// Insert pause in output. This is ActiveScript Shell-specific.
		s+= '\x13'; // DC3 (100ms delay)
		
		// Go back to beginning of marquee, minus the next leading space
		if (o < l) { // Don't after last frame
			var ccBack = (ccLead > 0) ? 1+w-ccLead : w;
			s+= '\b'.repeat(ccBack + sSuffix.length);
		}
	}
	
	// Show cursor
	s += "\x1B[?25h";
	
	return s;
}
