/*
** Change the console palette to the Solarized palette designed by Ethan Schoonover
** Solarized is a palette that does not respect the console and ANSI
** palettes, but provides replacement monotones and accent colors
** that reduces contrasting brightness while preserving contrasting
** hues, making text more comfortable to read.
**
** Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteSolarized()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x423607, // base02 (black)
		0xD28B26, // blue (blue)
		0x009985, // green (green)
		0x98A12A, // cyan (cyan)
		0x2F32DC, // red (red)
		0x8236D3, // magenta (magenta)
		0x0089B5, // yellow (yellow)
		0xD5E8EE, // base2 (white)
		0x362B00, // base03 (brblack)
		0x969483, // base0 (brblue)
		0x756E58, // base01 (brgreen)
		0xA1A193, // base1 (brcyan)
		0x164BCB, // orange (brred)
		0xC4716C, // violet (brmagenta)
		0x837B65, // base00 (bryellow)
		0xE3F6FD  // base3 (brwhite)
		].toVBArray();
}
