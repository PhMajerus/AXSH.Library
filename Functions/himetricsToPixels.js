/*
** OLE Automation helper to convert a number from OLE Size
** (himetrics) to pixels.
** Note this assumes 96 DPI screen.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from OLE Size (himetrics) to pixels at default 96DPI density.
function himetricsToPixels(size) {
	return Math.round(size*96/2540);
}
