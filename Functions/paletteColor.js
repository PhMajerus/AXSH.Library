/*
** OLE Automation helper to convert an index to the corresponding OLE Color.
** The result is an uncommon OLE Color that represent an index in the current
** palette instead of an RGB color.
** This is supported in "Majerus.ANSI" ForeColorRGB, BackColorRGB and
** ColorsRGB methods to specify 256 colors VT codes.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from a palette index to an OLE Color.
function paletteColor(index) {
	if (typeof index != "number")
		index = parseInt(index);
	if ((index < 0) || (index > 255)) {
		var e = new TypeError("index is outside of the 0 to 255 range");
		e.description = e.message;
		throw e;
	}
	
	return (1<<24) + index;
}
