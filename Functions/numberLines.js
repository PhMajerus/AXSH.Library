// This provides a quick way to add lines numbers to a multi-lines text.
// Note the output uses VT coloring and will only display properly in a modern console.

// Turn on strict mode for this file.
"use strict";

// Add line number prefixes in dark gray.
function numberLines(text)
{
	var a = text.split("\r\n");
	var cc = Math.floor(Math.log(a.length)*Math.LOG10E)+1;
	return a.map(function(line,index){
		var ln = (index+1).toString();
		return "\x1B[90m" + (' '.repeat(cc-ln.length)) + ln + "\u2502\x1B[m" + line;
	}).join("\r\n");
}
