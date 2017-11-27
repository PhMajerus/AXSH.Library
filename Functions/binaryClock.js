/*
** Displays a clock in binary notation.
** Requires bitsDots.js
*/


function binaryClock() {
	var now = new Date();
	echo(" \x1B[90m\u250C" + '\u2500'.repeat(12) + "\u2524 BINARY  CLOCK \u251C" + '\u2500'.repeat(12) + "\u2510\x1B[m");
	echo(" \x1B[90m\u2502" + ' '.repeat(41) + "\u2502\x1B[m");
	var day = now.getDay();
	var month = now.getMonth();
	echo(" \x1B[90m\u2502 " +
		"\x1B[31m" + "SMTWTFS".split('').map(function(item,index){ return(index==day ? "\x1B[32m"+item+"\x1B[31m" : item) }).join('') +" "+
		"\x1B[31m" + "JFMAMJJASOND".split('').map(function(item,index){ return(index==month ? "\x1B[32m"+item+"\x1B[31m" : item) }).join('') +" "+
		"\x1B[90m: D " + bitsDots(now.getDate(),8) +" "+
		"\x1B[32m" + now.getYear() +
		" \x1B[90m\u2502\x1B[m");
	echo(" \x1B[90m\u2502" + ' '.repeat(41) + "\u2502\x1B[m");
	echo(" \x1B[90m\u2502 H " + bitsDots(now.getHours(),8) +
		" \x1B[90m: M " + bitsDots(now.getMinutes(),8) +
		" \x1B[90m: S " + bitsDots(now.getSeconds(),8) +
		" \x1B[90m\u2502\x1B[m");
	echo(" \x1B[90m\u2502" + ' '.repeat(41) + "\u2502\x1B[m");
	echo(" \x1B[90m\u2514" + '\u2500'.repeat(41) + "\u2518\x1B[m");
}
