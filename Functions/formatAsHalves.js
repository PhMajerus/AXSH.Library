/*
** Format a number rounded to the nearest half (0.5) as a string using the
** Unicode vulgar fraction one half symbol (1/2).
*/


function formatAsHalves (val) {
	var i = Number(val);
	if (!isFinite(i)) {
		throw new Error("val argument must be a finite number");
	}
	
	// Decompose number into sign, integer and decimal parts
	var neg = i < 0;
	i = Math.abs(val);
	var f = i%1;
	i = Math.trunc(i);
	
	// Convert decimals to halves
	f = Math.round(f/0.5);
	if (f===2) {
		i++;
		f = 0;
	}
	
	// Build string
	return (neg?"-":"") + i.toString() + (f>0?"\u00BD":"");
}
