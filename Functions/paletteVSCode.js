/*
** Change the console palette to the standard Dark+ palette used in Visual Studio Code.
** A less contrasted than paletteModern, without any hard black or white.
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteVSCode()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x1E1E1E, // black
		0xC87224, // dark blue
		0x79BC0D, // dark green
		0xCDA811, // dark cyan
		0x3131CD, // dark red
		0xBC3FBC, // dark magenta
		0x10E5E5, // dark yellow
		0xCCCCCC, // light gray
		0x666666, // dark gray
		0xEA8E3B, // bright blue
		0x8BD123, // bright green
		0xDBB829, // bright cyan
		0x4C4CF1, // bright red
		0xD670D6, // bright magenta
		0x43F5F5, // bright yellow
		0xE5E5E5  // white
		].toVBArray();
}
