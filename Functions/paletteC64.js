/*
** Change the console palette to colors from the C=64 colors palette,
** while trying to keep colors indexes similar.
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteC64()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x000000, // 0 black
		0x792835, // 6 dark blue
		0x438D58, // 5 dark green
		0x003943, // dark brown (dark cyan)
		0x2B3768, // 2 dark red
		0x863D6F, // 4 dark magenta
		0x254F6F, // 8 light brown (dark yellow)
		0x959595, // F light gray
		0x444444, // B dark gray
		0xB55E6C, // E bright blue
		0x84D29A, // D bright green
		0xB2A470, // 3 bright cyan
		0x59679A, // A bright red
		0x6C6C6C, // C mid gray (bright magenta)
		0x6FC7B8, // 7 bright yellow
		0xFFFFFF  // 1 white
		].toVBArray();
}
