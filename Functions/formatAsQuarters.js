/*
** Format a number rounded to the nearest quarter (0.25) as a string using
** Unicode vulgar fraction symbols (1/4, 1/2, and 3/4).
*/


function formatAsQuarters (val) {
	var i = Number(val);
	if (!isFinite(i)) {
		throw new Error("val argument must be a finite number");
	}
	
	// Decompose number into sign, integer and decimal parts
	var neg = i < 0;
	i = Math.abs(val);
	var f = i%1;
	i = Math.trunc(i);
	
	// Convert decimals to quarters
	f = Math.round(f/0.25);
	if (f===4) {
		i++;
		f = 0;
	}
	
	// Build string
	var fraction = ["","\u00BC","\u00BD","\u00BE"];
	return (neg?"-":"") + i.toString() + fraction[f];
}
