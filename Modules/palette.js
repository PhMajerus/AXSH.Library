/* 
** Palette module for AXSH.
** Provides methods to easily change the console palette
** - Philippe Majerus
*/


// Turn on strict mode for this file.
"use strict";


/*
** Change the console palette to a more balanced and less contrasted palette,
** while keeping enough contrast for ANSI-art.
** This is the default ActiveScript Shell palette.
** by Philippe Majerus
*/
function standard()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x1E1E1E, // black
		0x922F2F, // dark blue
		0x2F922F, // dark green
		0xA3A33F, // dark cyan
		0x2F2F92, // dark red
		0xA33FA3, // dark magenta
		0x3FA3A3, // dark yellow
		0xA3A3A3, // light gray
		0x606060, // dark gray
		0xC46060, // bright blue
		0x60C460, // bright green
		0xD4D471, // bright cyan
		0x6060C4, // bright red
		0xD471D4, // bright magenta
		0x71D4D4, // bright yellow
		0xE5E5E5  // white
		].toVBArray();
}

/*
** A palette with even brightness for all bright and all dark colors.
** Designed for ActiveScript Shell
** by Philippe Majerus
*/
function even()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x1E1E1E, // black
		0xA33F3F, // dark blue
		0x3FA33F, // dark green
		0x81821E, // dark cyan
		0x3F3FA3, // dark red
		0x821E81, // dark magenta
		0x1E8182, // dark yellow
		0xA3A3A3, // light gray
		0x606060, // dark gray
		0xE58282, // bright blue
		0x82E582, // bright green
		0xC4C460, // bright cyan
		0x8282E5, // bright red
		0xC460C4, // bright magenta
		0x60C4C4, // bright yellow
		0xE5E5E5  // white
		].toVBArray();
}

/*
** Change the console palette to the RGBI (4-bits) palette, similar
** to CGA but with simple dark yellow (ochre) instead of brown.
*/
function RGBI()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x000000, // black
		0xAA0000, // dark blue
		0x00AA00, // dark green
		0xAAAA00, // dark cyan
		0x0000AA, // dark red
		0xAA00AA, // dark magenta
		0x00AAAA, // dark yellow
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

/*
** Change the console palette to the standard colors as used by CGA
** and matching default 16-colors palette used by EGA and VGA.
*/
function CGA()
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

/*
** Change the console palette to colors from the C=64 colors palette,
** while trying to keep colors indexes similar.
*/
function C64()
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

/*
** Change the console palette to the original Windows conhost palette.
** (The standard Windows console palette finally changed in Windows 10 Ver. 1709)
*/
function legacy()
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

/*
** The new Windows console palette from Windows 10 Ver. 1709 and later.
*/
function modern()
{
	var conhost = new ActiveXObject("Majerus.Console");
	conhost.colors.items = [
		0x0C0C0C, // black
		0xDA3700, // dark blue
		0x0EA113, // dark green
		0xDD963A, // dark cyan
		0x1F0FC5, // dark red
		0x981788, // dark magenta
		0x009CC1, // dark yellow
		0xCCCCCC, // light gray
		0x767676, // dark gray
		0xFF783B, // bright blue
		0x0CC616, // bright green
		0xD6D661, // bright cyan
		0x5648E7, // bright red
		0x9E00B4, // bright magenta
		0xA5F1F9, // bright yellow
		0xF2F2F2  // white
		].toVBArray();
}

/*
** Change the console palette to the standard Dark+ palette used in Visual Studio Code.
** A less contrasted than paletteModern, without any hard black or white.
*/
function VSCode()
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

/*
** Change the console palette to the Solarized palette designed by Ethan Schoonover
** Solarized is a palette that does not respect the console and ANSI
** palettes, but provides replacement monotones and accent colors
** that reduces contrasting brightness while preserving contrasting
** hues, making text more comfortable to read.
**
** Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
*/
function solarized()
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

/*
** Change the console palette to the light background version of
** the Solarized palette designed by Ethan Schoonover.
** This does not respect the console and ANSI palette, but instead
** reverses background tones and content tones so existing scripts
** designed for light content on dark background automatically
** show as light background. Accent colors are left intact.
**
** Credits: Ethan Schoonover (http://ethanschoonover.com/solarized)
*/
function solarizedLight()
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
