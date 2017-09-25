/*
** Calendar view for ActiveScript Shell with JScript
** - Philippe Majerus, September 2017
** 
** Set calendar.firstDayOfWeek property to change the first day of the week.
** 
** Note both JavaScript dates and OLEAUT dates (VT_DATE) are supported.
** Usage: calendar(), calendar(new Date(2010,2-1,16)), calendar(varDate)
*/

// Turn on strict mode for this file.
"use strict";

// If no argument is provided, shows the current date
function calendar(date)
{
	if (date == undefined)
		date = new Date();
	else // coerce into proper date
		date = new Date(date)
	
	var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
	var days = ["Su","Mo","Tu","We","Th","Fr","Sa"];
	
	var sb = new Array();
	
	// Change first day of the week if needed
	if (calendar.firstDayOfWeek != 0)
		days = days.map(function(day,index){ return days[(index+calendar.firstDayOfWeek)%7] });
	
	// Month and days headers
	sb.push(" \u250C" + '\u2500'.repeat(34) + "\u2510\r\n");
	var header = months[date.getMonth()] + " " + date.getFullYear();
	sb.push(" \u2502" + ' '.repeat(Math.floor((34-header.length)/2)) + header + ' '.repeat(Math.ceil((34-header.length)/2)) + "\u2502\r\n");
	sb.push(" \u251C" + days.map(function(){ return '\u2500'.repeat(4) }).join('\u252C') + "\u2524\r\n");
	sb.push(" \u2502" + days.map(function(day){ return " " + day + " " }).join('\u2502') + "\u2502\r\n");
	sb.push(" \u255E" + days.map(function(){ return '\u2550'.repeat(4) }).join('\u256A') + "\u2561\r\n");
	
	// find first day to display
	var prevMonthDays = (date.getDay() + (7-calendar.firstDayOfWeek%7) + (7-(date.getDate()-1)%7) )%7;
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


// Initialize first day of week as Sunday
calendar.firstDayOfWeek = 0;

/*
** You can override this at any time before calling the function,
** for example: calendar.firstDayOfWeek = 1; // Set first day of week as Monday.
**
** Even if the calendar() function is called for the first time after customizing this,
** it will not override your setting.
** This file will get parsed when calendar.firstDayOfWeek assignment is processed.
*/
