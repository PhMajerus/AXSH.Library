// This is a small library to provide a visual representation of binary
// Any safe positive integer can be converted to a VT string showing
// dots colored like LEDs on a diagnostic panel.
// This can be a fun accessory when teaching about binary.
// - Philippe Majerus, May 2017


// Turn on strict mode for this file.
"use strict";


// Return an ANSI/VT string of bullets colored according to the values of the bits of the number.
// Bullets are grouped by 4, each group separated by a space.
// cbits argument sets the number of bits to show, any higher bit is ignored.
// If not defined, the minimum number of bits required to represent the value is used.
// Note this assume the number is a safe positive integer, fractional or too large numbers, as well as negatives are not supported.
function bitsDots(number, cbits)
{
	if (cbits == undefined)
		for (cbits=1; (number>>cbits)>0; cbits++);
	else if ((typeof cbits != "number") || (cbits<0) || (cbits%1 != 0))
		throw new TypeError("cbits argument must be a positive integer number");
	
	var prev = undefined;
	var sb = new Array();
	for(var ibit=cbits;ibit>0;ibit--)
	{
		if (((ibit%4)==0) && (ibit!=cbits))
			sb.push(' ');
		var bit = number & (1<<(ibit-1));
		if (prev != bit)
		{
			sb.push(bit ? "\x1B[32m" : "\x1B[31m");
			prev = bit;
		}
		sb.push('\u2022');
	}
	sb.push("\x1B[39m");
	return sb.join('');
};
