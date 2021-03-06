/*
** A powerline-style prompt.
** 
** Requires a font that contains powerline glyphs, such as "Cascadia Mono PL".
** 
** Use by assigning to the prompt function as follows:
** prompt = powerlinePrompt;
*/

// Turn on strict mode for this file.
"use strict";

function powerlinePrompt () {
	// Prepare line 2 ("JS>")
	var l2;
	if (AXSH.configuration.isElevated) {
		l2 = "\x1B[43;30mJS\x1B[41;33m\uE0B0\x1B[97m Admin \x1B[49;31m\uE0B0\x1B[m ";
	} else {
		l2 = "\x1B[43;30mJS\x1B[49;33m\uE0B0\x1B[m ";
	}
	
	// Handle special case when location isn't set
	if (AXSH.location === undefined) {
		return "\r\n" + l2;
	}
	
	// Build a path array from the current location, not including the root container.
	var p=[];
	for (var fNext, f=AXSH.location; fNext=f.parent; f=fNext) {
		p.unshift(f.name);
	}
	
	// Get hyperlink URL if available
	var url, linkStart, linkEnd;
	try {
		url = AXSH.location.url;
	} catch(ex) {
		url = undefined;
	}
	if (url) {
		linkStart = "\x1B]8;;" + url + "\x07";
		linkEnd = "\x1B]8;;\x07";
	} else {
		linkStart = "";
		linkEnd = "";
	}
	
	// Prepare line 1 (path)
	var l1;
	if (p.length === 0) {
		l1 = linkStart + "\x1B[44;97m " + AXSH.location.name + " " + linkEnd + "\x1B[49;34m" + '\uE0B4' + "\x1B[m";
	} else {
		l1 = linkStart + "\x1B[46;97m " + p.shift();
		if (p.length === 0) {
			l1 += " \x1B[49;36m" + linkEnd + '\uE0B4' + "\x1B[m";
		} else {
			l1 += " \x1B[36;100m" + '\uE0B4' + "\x1B[37m " + p.join(" " + '\uE0B5' + " ") + " " + linkEnd + "\x1B[49;90m" + '\uE0B4' + "\x1B[m";
		}
	}
	
	// Return complete prompt string
	return "\r\n" + l1 + "\r\n" + l2;
};
