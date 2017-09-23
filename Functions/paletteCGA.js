/*
** Change the console palette to the standard colors as used by CGA
** and matching default 16-colors palette used by EGA and VGA.
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteCGA()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x000000, // black
		0xAA0000, // dark blue
		0x00AA00, // dark green
		0xAAAA00, // dark cyan
		0x0000AA, // dark red
		0xAA00AA, // dark magenta
		0x0055AA, // brown
		0xAAAAAA, // light gray
		0x555555, // dark gray
		0xFF5555, // bright blue
		0x55FF55, // bright green
		0xFFFF55, // bright cyan
		0x5555FF, // bright red
		0xFF55FF, // bright magenta
		0x55FFFF, // bright yellow
		0xFFFFFF  // white
		].toVBArray();
}
