/*
** Calendar view for ActiveScript Shell with JScript
** - Philippe Majerus, September 2017
*/

// Turn on strict mode for this file.
"use strict";

// If no argument is provided, shows the current date
function calendar(date)
{
	if (date == undefined)
		date = new Date();
	
	var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
	var days = ["Su","Mo","Tu","We","Th","Fr","Sa"];
	
	var sb = new Array();
	
	// Month and days headers
	sb.push(" \u250C" + '\u2500'.repeat(34) + "\u2510\r\n");
	var header = months[date.getMonth()] + " " + date.getFullYear();
	sb.push(" \u2502" + ' '.repeat(Math.floor((34-header.length)/2)) + header + ' '.repeat(Math.ceil((34-header.length)/2)) + "\u2502\r\n");
	sb.push(" \u251C" + days.map(function(){ return '\u2500'.repeat(4) }).join('\u252C') + "\u2524\r\n");
	sb.push(" \u2502" + days.map(function(day){ return " " + day + " " }).join('\u2502') + "\u2502\r\n");
	sb.push(" \u255E" + days.map(function(){ return '\u2550'.repeat(4) }).join('\u256A') + "\u2561\r\n");
	
	// find first day to display
	var prevMonthDays = (7+date.getDay()-(date.getDate()-1)%7)%7;
	var d = new Date(date.getTime() - (date.getDate()-1 + prevMonthDays)*1000*60*60*24);
	for (var l=0; l<6; l++)
	{
		if (l>0)
			sb.push(" \u251C" + days.map(function(){ return '\u2500'.repeat(4) }).join('\u253C') + "\u2524\r\n");
		sb.push(" ");
		for (var c=0; c<7; c++)
		{
			sb.push("\u2502");
			
			var s = d.getDate();
			s = (s<10?" ":"") + s.toString();
			if (d.getMonth() != date.getMonth())
				sb.push("\x1B[90m " + s + " ");
			else if (d.getDate() == date.getDate())
				sb.push("\x1B[34m\u2590\x1B[44;97m" + s + "\x1B[49;34m\u258C");
			else
				sb.push("\x1B[37m " + s + " ");
			sb.push("\x1B[m");
			d = new Date(d.getTime() + 1000*60*60*24);
			
		}
		sb.push("\u2502\r\n");
	}
	sb.push(" \u2514" + days.map(function(){ return '\u2500'.repeat(4) }).join('\u2534') + "\u2518");
	echo(sb.join(""));
}
