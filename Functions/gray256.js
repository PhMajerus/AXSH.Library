/*
** OLE Automation helper to convert lightness value to the corresponding 
** OLE Color using the ANSI/VT 256 colors palette.
** This is used to compute colors for use with Majerus.ANSI RGB colors methods.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from lightness value to a palette-indexed OLE Color.
function gray256(lightness) {
	if ((lightness < 0) || (lightness > 1)) {
		var e = new TypeError("lightness out of range: 0 \u2264 lightness \u2264 1");
		e.description = e.message;
		throw e;
	}
	
	return (1<<24) + 232 + Math.round(lightness*23);
}
