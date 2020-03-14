/*
** Get the time as large text similar to a LED segments display.
** If no time is specified, the current time is used.
** 
** - Philippe Majerus - Semptember 2017, updated March 2020
*/

// Turn on strict mode for this file.
"use strict";

function getDigitalClock(time) {
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
		/* 0 */ [" \u2550\u2550 ","\u2551  \u2551","    ","\u2551  \u2551"," \u2550\u2550 "],
		/* 1 */ ["    ","   \u2551","    ","   \u2551","    "],
		/* 2 */ [" \u2550\u2550 ","   \u2551"," \u2550\u2550 ","\u2551   "," \u2550\u2550 "],
		/* 3 */ [" \u2550\u2550 ","   \u2551"," \u2550\u2550 ","   \u2551"," \u2550\u2550 "],
		/* 4 */ ["    ","\u2551  \u2551"," \u2550\u2550 ","   \u2551","    "],
		/* 5 */ [" \u2550\u2550 ","\u2551   "," \u2550\u2550 ","   \u2551"," \u2550\u2550 "],
		/* 6 */ [" \u2550\u2550 ","\u2551   "," \u2550\u2550 ","\u2551  \u2551"," \u2550\u2550 "],
		/* 7 */ [" \u2550\u2550 ","   \u2551","    ","   \u2551","    "],
		/* 8 */ [" \u2550\u2550 ","\u2551  \u2551"," \u2550\u2550 ","\u2551  \u2551"," \u2550\u2550 "],
		/* 9 */ [" \u2550\u2550 ","\u2551  \u2551"," \u2550\u2550 ","   \u2551"," \u2550\u2550 "],
		/* : */ [" ","\u25CB"," ","\u25CB"," "]
	];
	
	var text = time.getHours().toString().padStart(2,'0') + ":" +
		time.getMinutes().toString().padStart(2,'0') + ":" +
		time.getSeconds().toString().padStart(2,'0');
	
	var banner = new Array();
	for (var l = 0; l < 5; l++)
		banner[l] = new Array();
	for (var i = 0; i < text.length; i++) {
		var index = text.charCodeAt(i) - 48;
		for (var l = 0; l < 5; l++)
			banner[l].push(segments[index][l]);
	}
	for (var l = 0; l < 5; l++)
		banner[l] = " " + banner[l].join(" ") + " ";
	return banner.join("\r\n");
}
