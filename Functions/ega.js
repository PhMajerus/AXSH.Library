/*
** Returns the RGB OLEColor for an EGA palette color index.
*/


function ega(index) {
	if ((index < 0)||(index > 63)) {
		var e = new TypeError("Color index must be between 0 and 63");
		e.description = e.message;
		throw e;
	}
	
	var r = (((index>>>1)&2)+((index>>>5)&1))*85;
	var g = (((index>>>0)&2)+((index>>>4)&1))*85;
	var b = (((index<<1)&2)+((index>>>3)&1))*85;
	return (b<<16) | (g<<8) | r;
}
