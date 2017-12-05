/*
** OLE Automation helper to convert hue, saturation,
** lightness values to the corresponding OLE Color.
** Unlike the common hsl(h,s,l) function, this one
** provides more balanced sin-based colors.
** Arguments are identical to hsl and it can be
** used as an in-place replacement.
** 
** - Philippe Majerus, December 2017.
*/


// Turn on strict mode for this file.
"use strict";


// Convert from hue,satur.,light. values to an OLE Color.
function sinebow(hue, saturation, lightness) {
	if ((saturation < 0) || (saturation > 1)) {
		var e = new TypeError("saturation out of range: 0 \u2264 saturation \u2264 1");
		e.description = e.message;
		throw e;
	}
	if ((lightness <0) || (lightness > 1)) {
		var e = new TypeError("lightness out of range: 0 \u2264 lightness \u2264 1");
		e.description = e.message;
		throw e;
	}
	
	var chroma = (1 - Math.abs(2*lightness - 1)) * saturation / 2;
	var o = Math.PI*2/3;
	var a = Math.PI/2 - hue*Math.PI/180;
	var r = Math.sin(a) * chroma + lightness;
	var g = Math.sin(a+o) * chroma + lightness;
	var b = Math.sin(a+o*2) * chroma + lightness;
	
	return (Math.round(b*255) << 16) | (Math.round(g*255) << 8) | Math.round(r*255);
}
