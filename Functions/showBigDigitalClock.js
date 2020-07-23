/*
** Show the time as large text similar to a LED segments display.
** If no time is specified, the current time is used.
** 
** - Philippe Majerus - Semptember 2017, updated March 2020
*/


function showBigDigitalClock (time) {
	AXSH.echo("\x1B[92m" + getBigDigitalClock(time) + "\x1B[m");
}
