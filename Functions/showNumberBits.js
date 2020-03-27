/*
** JavaScript numbers are always IEEE 754 64-bit floating-point (double).
** This function shows in the console the binary representation of any number
** and the decoding of its value. JavaScript also stores dates as numbers.
** It is designed as a learning and debugging tool to get a better
** understanding of numbers and dates representations in memory.
** 
** Philippe Majerus, November 2019, updated March 2020.
*/

function showNumberBits(number) {
	number = Number(number);
	
	// We use the "Majerus.JSX" component to get ArrayBuffer and DataView for JScript,
	// but in other environments, this can very easily be replaced by ES6 ArrayBuffer and DataView.
	var JSX = new ActiveXObject("Majerus.JSX");
	
	var buffer = new JSX.ArrayBuffer(8);
	var view = new JSX.DataView(buffer);
	view.setFloat64(0,number);
	var hi = view.getUint32(0);
	var lo = view.getUint32(4);
	var pad = '0'.repeat(32);
	var bin = (pad+hi.toString(2)).slice(-32) + (pad+lo.toString(2)).slice(-32);
	
	AXSH.echo(" \x1B[96m\u00B1\x1B[92m  exponent \x1B[91m                     fraction                     \x1B[m");
	AXSH.echo(" \x1B[97;46m"+bin.substr(0,1)+"\x1B[42m"+bin.substr(1,11)+"\x1B[41m"+bin.substr(12,52)+"\x1B[m");
	AXSH.echo(" \x1B[36m6\x1B[32m66655555555\x1B[31m5544444444443333333333222222222211111111119876543210\x1B[m");
	AXSH.echo(" \x1B[36m3\x1B[32m21098765432\x1B[31m109876543210987654321098765432109876543210\x1B[90m    (bit#)\x1B[m");
	
	var sgn = -((hi & 0x80000000)>>31);
	var exp = ((hi & 0x7FF00000)>>20);
	var mts = ((hi & 0x000FFFFF)*Math.pow(2,32)+lo);
	AXSH.echo(" \x1B[96m"+ sgn +"  \x1B[92m"+ exp + ((exp!==0&exp!==2047)?(" \x1B[32m-1023 = "+(exp-1023)):"") +"  \x1B[91m"+ mts +" \x1B[31m/2**52 = "+ (mts/Math.pow(2,52)) +"\x1B[m");
	
	AXSH.echo();
	exp -= 1023; // bias
	if (exp === -1023) {
		if (mts === 0) {
			AXSH.echo("Exponent is all 0s and fraction=0 => Special value for \u00B10");
			AXSH.echo(" "+ (sgn?"-":"") +"0");
		} else {
			// Subnormal number
			AXSH.echo("Exponent is all 0s => Subnormal number");
			mts /= Math.pow(2,52);
			AXSH.echo("Fraction does \x1B[4mnot\x1B[24m have an implied leading 1, m = "+ mts);
			AXSH.echo(" \x1B[96m"+ (sgn?"-":"+") +" \x1B[m2**-1022 * \x1B[91m"+ mts +"\x1B[m = "+ number);
		}
	} else if (exp === 1024) {
		// NaN and Infinities
		AXSH.echo("Exponent is all 1s => Special NaN & \u00B1Infinity");
		AXSH.echo(" \x1B[m"+ number);
	} else {
		AXSH.echo("Exponent has a 1023 bias, exponent = "+ exp);
		mts = 1+(mts/Math.pow(2,52)); // implicit leading 1
		AXSH.echo("Fraction has an implied leading 1, mantissa = "+ mts);
		AXSH.echo(" \x1B[96m"+ (sgn?"-":"+") +" \x1B[92m2**"+ exp +"\x1B[m * \x1B[91m"+ mts +"\x1B[m = "+ number);
	}
}
