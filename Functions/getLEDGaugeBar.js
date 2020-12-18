/*
** Returns a horizontal bar showing the value as a bars graph,
** simulating the style of green LED gauge bars with gaps.
** 
** The only Windows built-in app that used such a control was the original
** Windows NT Task Manager from NT4 to 7 to show CPU Usage and Memory.
** (It was a custom control for that app only)
*/


function getLEDGaugeBar (value, maximum, width) {
	if ((value < 0) || (value > maximum)) {
		throw new Error("value must be between 0 and maximum");
	}
	if (maximum < 0) {
		throw new Error("maximum must be a positive number");
	}
	var w = Math.floor(width);
	var p = maximum!==0 ? Math.floor((value/maximum)*w +.5) : 0;
	
	var i, result = "\x1B[38;5;77m";
	for (i=0; i<p; i++)
		result += '\u258C';
	result += "\x1B[38;5;22m";
	for (i=i; i<w; i++)
		result += '\u258C';
	result += "\x1B[m";
	
	return result;
}
