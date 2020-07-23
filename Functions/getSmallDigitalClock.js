/*
** Get the time as text similar to a LED segments display.
** If no time is specified, the current time is used.
** 
** The returned string fits on a single line, but requires VT control
** sequences and proper terminal or console support for underline and
** overline. (such as Windows Terminal 1.2 and later has)
** 
** - Philippe Majerus - July 2020
*/

// Turn on strict mode for this file.
"use strict";

function getSmallDigitalClock(time) {
	if (time === undefined)
		time = new Date();
	else
		time = new Date(time);
	if (isNaN(time)) {
		var e = new TypeError("Invalid time value");
		e.description = e.message;
		throw e;
	}
	
	var segments = [
		/* 0 */ "\u00A6\x1B[4;53m \x1B[55;24m\u00A6",
		/* 1 */ " \u00A6 ",
		/* 2 */ ".\x1B[4;53;9m-\x1B[29;55;24m'",
		/* 3 */ " \x1B[4;53;9m-\x1B[29;55;24m\u00A6",
		/* 4 */ "'\x1B[9m-\x1B[29m\u00A6",
		/* 5 */ "'\x1B[4;53;9m-\x1B[29;55;24m,",
		/* 6 */ "\u00A6\x1B[4;53;9m-\x1B[29;55;24m,",
		/* 7 */ " \x1B[53m \x1B[55m\u00A6",
		/* 8 */ "\u00A6\x1B[4;53;9m-\x1B[29;55;24m\u00A6",
		/* 9 */ "'\x1B[4;53;9m-\x1B[29;55;24m\u00A6",
		/* : */ ":"
	];
	
	var text = time.getHours().toString().padStart(2,'0') + ":" +
		time.getMinutes().toString().padStart(2,'0') + ":" +
		time.getSeconds().toString().padStart(2,'0');
	
	var banner = new Array();
	for (var i = 0; i < text.length; i++) {
		var index = text.charCodeAt(i) - 48;
		banner.push(segments[index]);
	}
	return banner.join("");
}
