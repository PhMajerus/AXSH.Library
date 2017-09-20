/*
** Change the console palette to a more balanced and less contrasted palette,
** similar to the palettes found in many Unix and GNU terminals.
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteModern()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x000000, // black
		0xBB0000, // dark blue
		0x00BB00, // dark green
		0xBBBB00, // dark cyan
		0x0000BB, // dark red
		0xBB00BB, // dark magenta
		0x00BBBB, // dark yellow
		0xBBBBBB, // light gray
		0x7F7F7F, // dark gray
		0xFF5C5C, // bright blue
		0x00FC00, // bright green
		0xFFFF00, // bright cyan
		0x0000FC, // bright red
		0xFF00FF, // bright magenta
		0x00FFFF, // bright yellow
		0xFFFFFF  // white
		].toVBArray();
}
