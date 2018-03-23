/****************************************************************************
** Metric.js  (JScript Module)
** 
** Metric and SI (International System of Units) helper module for JScript.
** This module contains multipliers prefixes as properties, and methods
** to format string representations of numbers in scientific notations with
** prefixes symbols.
** 
** - Philippe Majerus, November 2017.
** 
****************************************************************************/

// Turn on strict mode for this file.
"use strict";


// Public module methods
var sym, symSI, expNorm, expEng, parse, from, to;


// Hide implementation in a closure to avoid showing private variables and
// functions in the module's public interface.
(function(module){
	
	// Metric/SI prefixes by names
	var lookupPrefixesNames = {
		yotta: 1e24,
		zetta: 1e21,
		exa: 1e18,
		peta: 1e15,
		tera: 1e12,
		giga: 1e9,
		mega: 1e6,
		kilo: 1e3,
		hecto: 1e2,
		deca: 1e1,
		deci: 1e-1,
		centi: 1e-2,
		milli: 1e-3,
		micro: 1e-6,
		nano: 1e-9,
		pico: 1e-12,
		femto: 1e-15,
		atto: 1e-18,
		zepto: 1e-21,
		yocto: 1e-24
	};
	
	// Symbols lookup tables
	var positiveSI = ["k","M","G","T","P","E","Z","Y"];
	var negativeSI = ["m","\xB5","n","p","f","a","z","y"];
	var positiveB10 = ["da","h"];
	var negativeB10 = ["d","c"];
	
	
	// Add prefixes as properties of module
	for (var name in lookupPrefixesNames)
		module[name.toUpperCase()] = lookupPrefixesNames[name];
	
	
	// Format a number to a base 10 SI number & prefix symbol string.
	sym = function (number) {
		if (typeof number !== "number")
			number = new Number(number);
		
		if (number === 0) {
			return "0";
		}
		
		// Find exponent
		var exponent = Math.floor(Math.log10(Math.abs(number)));
		if (Math.abs(exponent) < 3) {
			// hecto, deca, unit, deci or centi
			var significand = (number / Math.pow(10,exponent)).toFixed(2);
			if (exponent === 0) {
				return significand;
			} else if (exponent < 0) {
				return significand + negativeB10[-exponent-1];
			} else {
				return significand + positiveB10[exponent-1];
			}
		} else {
			// standard base 1000 symbol
			exponent = Math.floor(exponent / 3);
			if (exponent > positiveSI.length) {
				exponent = positiveSI.length;
			} else if (exponent < -negativeSI.length) {
				exponent = -negativeSI.length;
			}
			var significand = (number / Math.pow(10,exponent*3)).toFixed(2);
			if (exponent < 0) {
				return significand + negativeSI[-exponent-1];
			} else {
				return significand + positiveSI[exponent-1];
			}
		}
	};
	
	// Format a number to a base 1000 SI number & prefix symbol string.
	symSI = function (number) {
		if (typeof number !== "number")
			number = new Number(number);
		
		if (number === 0) {
			return "0";
		}
		
		// Find exponent
		var exponent = Math.floor( Math.floor(Math.log10(Math.abs(number))) / 3);
		if (exponent > positiveSI.length) {
			exponent = positiveSI.length;
		} else if (exponent < -negativeSI.length) {
			exponent = -negativeSI.length;
		}
		
		var significand = (number / Math.pow(10,exponent*3)).toFixed(2);
		if (exponent === 0) {
			return significand;
		} else if (exponent < 0) {
			return significand + negativeSI[-exponent-1];
		} else {
			return significand + positiveSI[exponent-1];
		}
	};
	
	expNorm = function (number) {
		if (typeof number !== "number")
			number = new Number(number);
		
		if (number === 0) {
			return "0e0";
		}
		
		// Find exponent
		var exponent = Math.floor(Math.log10(Math.abs(number)));
		var significand = (number / Math.pow(10,exponent)).toFixed(2);
		if (exponent < 0) {
			return significand + "e-" + (-exponent).toString();
		} else {
			return significand + "e" + exponent.toString();
		}
	};
	
	expEng = function (number) {
		if (typeof number !== "number")
			number = new Number(number);
		
		if (number === 0) {
			return "0e0";
		}
		
		// Find exponent
		var exponent = Math.floor( Math.floor(Math.log10(Math.abs(number))) / 3) * 3;
		var significand = (number / Math.pow(10,exponent)).toFixed(2);
		if (exponent < 0) {
			return significand + "e-" + (-exponent).toString();
		} else {
			return significand + "e" + exponent.toString();
		}
	};
	
	// Metric/SI prefixes by symbols
	var lookupPrefixesSymbols = {
		"Y": 24,
		"Z": 21,
		"E": 18,
		"P": 15,
		"T": 12,
		"G": 9,
		"M": 6,
		"k": 3,
		"h": 2,
		"da": 1,
		"d": -1,
		"c": -2,
		"m": -3,
		"u": -6, "\xB5"/* micro symbol */: -6,
		"n": -9,
		"p": -12,
		"f": -15,
		"a": -18,
		"z": -21,
		"y": -24
	};
	
	parse = function (strNumber) {
		var numberRegex = /^(([-+]?\d*)(\.\d*)?)([eE]([-+]?\d+))?([yzafpnu\xB5mcdhkMGTPEZY]|da)?$/;
		// match groups:    [  1 = number      ][ 4=scient.exp. ][      6 = symbol             ]
		//     (0=all)       [ 2=int. ][3=dec.]      [5=E.num.]
		
		var res = strNumber.match(numberRegex);
		if (res === null) {
			var e = new TypeError("Parse argument '"+ strNumber +"' is not a valid number");
			e.description = e.message;
			throw e;
		}
		
		var num = parseFloat(res[1]);
		var exp = 0;
		if (res[5]!=="") {
			exp = parseInt(res[5]);
		}
		if (res[6]!=="") {
			exp += lookupPrefixesSymbols[res[6]];
		}
		return num * Math.pow(10,exp);
	};
	
	var lookupConversions = {
		// Volume
		"ustsp": 202.88, // US Teaspoons
		"ustblsp": 67.628, // US Tablespoons
		"usfloz": 33.814, // US Fluid Ounces
		"uscup": 4.2268, // US Cups
		"uspt": 2.1134, // US Pints
		"usqt": 1.0567, // US Quarts (liquid)
		"usqtdry": 0.90808, // US Quarts (dry)
		"usgal": 0.26417, // US Gallons
		"uktsp": 281.56, // UK Teaspoons
		"uktblsp": 70.390, // UK Tablespoons
		"ukfloz": 35.195, // UK Fluid Ounces
		"ukpt": 1.7598, // UK Pints
		"ukqt": 0.87988, // UK Quarts
		"ukgal": 0.21997, // UK Gallons
		// Length
		"au": 1/149597870700, // Astronomical units
		"ly": 1/9460730472580800, // Lightyears
		"in": 39.370, // Inches
		"ft": 3.2808, // Feet
		"yd": 1.0936, // Yards
		"mi": 6.2137e-4, // Miles
		"nmi": 5.3996e-4, // Nautical Miles
		// Weight and Mass
		"ct": 5.0, // Carats
		"oz": 3.52739619495804e-2, // Ounces
		"lb": 2.20462262184878e-3, // Pounds
		"st": 1.5747304441777e-4, // Stones
		"ust": 1.10231131092439e-6, // US Short tons
		"ukt": 9.84206527611061e-7 // UK Long tons
	};
	
	// Convert from a legacy/non-standard unit to metric/SI
	from = function (number, unit) {
		if (lookupConversions[unit] === undefined) {
			var e = new TypeError("from unit is not a known unit");
			e.description = e.message;
			throw e;
		}
		return number / lookupConversions[unit];
	};
	
	// Convert from metric/SI to a legacy/non-standard unit
	to = function (number, unit) {
		if (lookupConversions[unit] === undefined) {
			var e = new TypeError("to unit is not a known unit, try prefixing unit with 'us' or 'uk'");
			e.description = e.message;
			throw e;
		}
		return number * lookupConversions[unit];
	};
	
})(this);
