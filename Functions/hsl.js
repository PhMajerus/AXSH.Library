/*
** OLE Automation helper to convert hue, saturation,
** lightness values to the corresponding OLE Color.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from hue,satur.,light. values to an OLE Color.
function hsl(hue, saturation, lightness) {
	hue = hue % 360;
	if ((saturation < 0) || (saturation > 1)) {
		var e = new TypeError("saturation out of range: 0 \u2264 saturation \u2264 1");
		e.description = e.message;
		throw e;
	}
	if ((lightness < 0) || (lightness > 1)) {
		var e = new TypeError("lightness out of range: 0 \u2264 lightness \u2264 1");
		e.description = e.message;
		throw e;
	}
	
	var chroma = (1 - Math.abs(2*lightness - 1)) * saturation;
	var h = hue / 60;
	var x = chroma * (1 - Math.abs(h % 2 - 1));
	var rgb;
	if (h <= 1)
		rgb = {red:chroma, green:x, blue:0};
	else if (h <= 2)
		rgb = {red:x, green:chroma, blue:0};
	else if (h <= 3)
		rgb = {red:0, green:chroma, blue:x};
	else if (h <= 4)
		rgb = {red:0, green:x, blue:chroma};
	else if (h <= 5)
		rgb = {red:x, green:0, blue:chroma};
	else // (h <= 6)
		rgb = {red:chroma, green:0, blue:x};
	var m = lightness - chroma / 2;
	
	return (Math.round((rgb.blue+m)*255) << 16) | (Math.round((rgb.green+m)*255) << 8) | Math.round((rgb.red+m)*255);
}
