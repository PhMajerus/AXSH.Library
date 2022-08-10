/*
** Format a number rounded to the nearest fifth (0.2) as a string using
** Unicode vulgar fraction symbols (1/5, 2/5, 3/5, and 4/5).
*/


function formatAsFifths (val) {
	var i = Number(val);
	if (!isFinite(i)) {
		throw new Error("val argument must be a finite number");
	}
	
	// Decompose number into sign, integer and decimal parts
	var neg = i < 0;
	i = Math.abs(val);
	var f = i%1;
	i = Math.trunc(i);
	
	// Convert decimals to fifths
	f = Math.round(f/0.2);
	if (f===5) {
		i++;
		f = 0;
	}
	
	// Build string
	var fraction = ["","\u2155","\u2156","\u2157","\u2158"];
	return (neg?"-":"") + i.toString() + fraction[f];
}
