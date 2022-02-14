/*
** Format a number rounded to the nearest eighth (0.125) as a string using
** Unicode vulgar fraction symbols (1/8, 1/4, 3/8, 1/2, 5/8, 3/4, and 7/8).
*/


function formatAsEighths (val) {
	var i = Number(val);
	if (!isFinite(i)) {
		throw new Error("val argument must be a finite number");
	}
	
	// Decompose number into sign, integer and decimal parts
	var neg = i < 0;
	i = Math.abs(val);
	var f = i%1;
	i = Math.floor(i);
	
	// Convert decimals to eighths
	f = Math.round(f/0.125);
	if (f===8) {
		i++;
		f = 0;
	}
	
	// Build string
	var fraction = ["","\u215B","\u00BC","\u215C","\u00BD","\u215D","\u00BE","\u215E"];
	return (neg?"-":"") + i.toString() + fraction[f];
}
