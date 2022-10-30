/*
** Returns the RGB OLEColor for an EGA color index.
** 
** Based on the original hardware colors of the IBM Enhanced Graphics
** Adapter card, as well as the EGA monitor signals, which used 2 bits per
** RGB channel. It isn't technically a palette, as these were the 64 colors
** the hardware was capable of producing, but the text and graphics modes
** were limited to 16 simultaneous colors.
** 
** Note the CGA (IBM Color Graphics Adapter) colors are not completely
** sequential because RGBI monitors replaced dark yellow with brown.
** The CGA palette are indexes 0,1,2,3,4,5,20,7,56,57,58,59,60,61,62,63.
*/


function egaColor(index) {
	index = Number(index);
	if (isNaN(index)||(index < 0)||(index > 63)) {
		var e = new TypeError("Color index must be between 0 and 63");
		e.description = e.message;
		throw e;
	}
	
	var r = (((index>>>1)&2)+((index>>>5)&1))*85;
	var g = (((index>>>0)&2)+((index>>>4)&1))*85;
	var b = (((index<<1)&2)+((index>>>3)&1))*85;
	return (b<<16) | (g<<8) | r;
}
