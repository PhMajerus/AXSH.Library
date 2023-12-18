/*
** Use the Farey algorithm to find rational approximations of floating-point
** numbers, which is the most simplified fraction that can represent the
** number.
** This can be an easy way to present more human-readable representations of
** numbers. The returned value is not necessarily the exact value, but
** the closest approximation possible within the specified limit.
** A comparison with the actual value should be used before settling on using
** a rational approximation at all.
** 
** value is the number to convert to a fraction.
** limit is the maximum denominator, excluded.
** The result is returned as an object with numerator and denominator
** properties, as well as valueOf and toString methods to convert to
** a Number or a String respectively.
** 
** Note JavaScript will use the valueOf method and convert it to a string
** when coercing into a string, resulting in a string representation of its
** numerical value instead of the fraction.
** An explicit coercion using the String() function, or calling its
** .toString() method is required to get a string representation of its
** fraction.
** 
** Example usage:
** showObject(farey(Math.PI,10));
** ?farey(Math.PI).toString();
*/

function farey(value,limit) {
	function Rational(numerator, denominator) {
		this.numerator = numerator;
		this.denominator = denominator;
	}
	Rational.prototype.valueOf = function(){
		return this.numerator / this.denominator;
	};
	Rational.prototype.toString = function(){
		return this.numerator + "/" + this.denominator;
	};
	
	// Speed up computation for integers.
	if (Math.floor(value) === value) {
		return new Rational(value, 1);
	}
	
	if (value < 0) {
		var val = farey(-value, limit);
		return new Rational(-val.numerator, val.denominator);
	}
	var maxDenom = limit || 1000;
	
	// Start with full range from 0 to infinity.
	var lower = new Rational(0, 1);
	var upper = new Rational(1, 0);
	var mediant = new Rational(1, 1);
	while (maxDenom > mediant.denominator) {
		if (value * mediant.denominator > mediant.numerator) {
			// The value is between mediant and upper,
			// use mediant to upper as our new range.
			lower = mediant;
		} else {
			// The value is between lower and mediant,
			// use lower to mediant as our new range.
			upper = mediant;
		}
		
		if (value * mediant.denominator == mediant.numerator) {
			// The value is exactly the mediant fraction,
			// no more iterations required.
			break;
		}
		
		// Calculate Farey mediant fraction of current range for
		// next iteration.
		mediant = new Rational(lower.numerator + upper.numerator, lower.denominator + upper.denominator);
	}
	
	// Return the bound that's closer to the actual value.
	if ((value - lower.valueOf()) <= (upper.valueOf() - value)) {
		return lower;
	} else {
		return upper;
	}
}
