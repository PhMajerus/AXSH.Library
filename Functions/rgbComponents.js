// OLE Automation helper to convert an OLE Color to separate RGB components
// values.

// Turn on strict mode for this file.
"use strict";

// Convert from an OLE Color to an object containing red, green and blue members.
function rgbComponents(color)
{
	if ((color & 0xFF000000) != 0)
		throw Error("Provided color is not an RGB color.");
	var red = color & 0x0000FF;
	var green = (color & 0x00FF00)>>8;
	var blue = (color & 0xFF0000)>>16;
	return {"red":red, "green":green, "blue":blue};
}
