/*
** Change the console palette to the original Windows conhost palette.
** (The standard Windows console palette finally changed in Windows 10 Ver. 1710)
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteLegacy()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x000000, // black
		0x800000, // dark blue
		0x008000, // dark green
		0x808000, // dark cyan
		0x000080, // dark red
		0x800080, // dark magenta
		0x008080, // dark yellow
		0xC0C0C0, // light gray
		0x808080, // dark gray
		0xFF0000, // bright blue
		0x00FF00, // bright green
		0xFFFF00, // bright cyan
		0x0000FF, // bright red
		0xFF00FF, // bright magenta
		0x00FFFF, // bright yellow
		0xFFFFFF  // white
		].toVBArray();
}
