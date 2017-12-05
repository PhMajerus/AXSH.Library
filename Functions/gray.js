/*
** OLE Automation helper to convert lightness value to
** the corresponding OLE Color.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from lightness value to an OLE Color.
function gray(lightness) {
	if ((lightness < 0) || (lightness > 1)) {
		var e = new TypeError("lightness out of range: 0 \u2264 lightness \u2264 1");
		e.description = e.message;
		throw e;
	}
	
	var l = Math.round(lightness*255);
	return (l << 16) | (l << 8) | (l);
}
