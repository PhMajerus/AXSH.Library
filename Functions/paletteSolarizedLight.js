/*
** Change the console palette to the light background version of
** the Solarized palette designed by Ethan Schoonover.
** This does not respect the console and ANSI palette, but instead
** reverses background tones and content tones so existing scripts
** designed for light content on dark background automatically
** show as light background. Accent colors are left intact.
**
** Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
**
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function paletteSolarizedLight()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0xD5E8EE, // base2 (black)
		0xD28B26, // blue (blue)
		0x009985, // green (green)
		0x98A12A, // cyan (cyan)
		0x2F32DC, // red (red)
		0x8236D3, // magenta (magenta)
		0x0089B5, // yellow (yellow)
		0x423607, // base02 (white)
		0xE3F6FD, // base3 (brblack)
		0x837B65, // base00 (brblue)
		0xA1A193, // base1 (brgreen)
		0x756E58, // base01 (brcyan)
		0x164BCB, // orange (brred)
		0xC4716C, // violet (brmagenta)
		0x969483, // base0 (bryellow)
		0x362B00  // base03 (brwhite)
		].toVBArray();
}
