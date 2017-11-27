/*
** Show the current time as large text similar to a LED segments display.
** 
** - Philippe Majerus - Semptember, 2017
*/

// Turn on strict mode for this file.
"use strict";

function digitalClock() {
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
		/* : */ [" ","\u2022"," ","\u2022"," "]
	];
	
	var now = new Date();
	var time = now.getHours().toString().padStart(2,'0') + ":" +
		now.getMinutes().toString().padStart(2,'0') + ":" +
		now.getSeconds().toString().padStart(2,'0');
	
	var banner = new Array();
	for (var l = 0; l < 5; l++)
		banner[l] = new Array();
	for (var i = 0; i < time.length; i++) {
		var index = time.charCodeAt(i) - 48;
		for (var l = 0; l < 5; l++)
			banner[l].push(segments[index][l]);
	}
	for (var l = 0; l < 5; l++)
		banner[l] = " " + banner[l].join(" ");
	echo("\x1B[92m" + banner.join("\r\n") + "\x1B[m");
}
