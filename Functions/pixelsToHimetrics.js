/*
** OLE Automation helper to convert a number from pixels
** to OLE Size (himetrics).
** Note this assumes 96 DPI screen.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from pixels at default 96DPI density to OLE Size (himetrics).
function pixelsToHimetrics(pixels) {
	return Math.round(pixels*2540/96);
}
