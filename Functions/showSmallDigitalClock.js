/*
** Show the time as text similar to a LED segments display.
** If no time is specified, the current time is used.
** 
** The returned string fits on a single line, but requires VT control
** sequences and proper terminal or console support for underline and
** overline. (such as Windows Terminal 1.2 and later has)
** 
** - Philippe Majerus - July 2020
*/


function showSmallDigitalClock (time) {
	AXSH.echo("\x1B[92m" + getSmallDigitalClock(time) + "\x1B[m");
}
