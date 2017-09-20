// OLE Automation helper to convert reg, green and blue 0..255 values
// to the corresponding OLE Color.

// Turn on strict mode for this file.
"use strict";

// Convert from red, green and blue values to an OLE Color.
function rgb(red, green, blue)
{
	if ((red < 0)||(red > 255)||(green < 0)||(green > 255)||(blue < 0)||(blue > 255))
		throw Error("Color components must be between 0 and 255");
	return (blue << 16) | (green << 8) | (red);
}
