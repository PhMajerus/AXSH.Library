/****************************************************************************
** MorseCode.js  (JScript Module)
** 
** ITU Morse Code encoder for JScript.
** 
** This module provides a single encode method to convert a string into
** its morse code representation using middle dots and dashes.
** Based on standard ITU-R M.1677-1 (https://www.itu.int/rec/R-REC-M.1677)
** 
** - Philippe Majerus, February 2018, updated October 2020.
** 
****************************************************************************/

// Turn on strict mode for this file.
"use strict";


// Public methods
var encode;


// Use an IIFE to hide the implementation in a closure.
// This avoids showing private variables and functions in the module's public interface.
(function(){
	
	// International Morse Code (ITU) as Unicode strings
	var encodingTable = {
		A: "\xB7-",
		B: "-\xB7\xB7\xB7",
		C: "-\xB7-\xB7",
		D: "-\xB7\xB7",
		E: "\xB7",
		F: "\xB7\xB7-\xB7",
		G: "--\xB7",
		H: "\xB7\xB7\xB7\xB7",
		I: "\xB7\xB7",
		J: "\xB7---",
		K: "-\xB7-",
		L: "\xB7-\xB7\xB7",
		M: "--",
		N: "-\xB7",
		O: "---",
		P: "\xB7--\xB7",
		Q: "--\xB7-",
		R: "\xB7-\xB7",
		S: "\xB7\xB7\xB7",
		T: "-",
		U: "\xB7\xB7-",
		V: "\xB7\xB7\xB7-",
		W: "\xB7--",
		X: "-\xB7\xB7-",
		Y: "-\xB7--",
		Z: "--\xB7\xB7",
		1: "\xB7----",
		2: "\xB7\xB7---",
		3: "\xB7\xB7\xB7--",
		4: "\xB7\xB7\xB7\xB7-",
		5: "\xB7\xB7\xB7\xB7\xB7",
		6: "-\xB7\xB7\xB7\xB7",
		7: "--\xB7\xB7\xB7",
		8: "---\xB7\xB7",
		9: "----\xB7",
		0: "-----",
		' ': " ",
		'.': "\xB7-\xB7-\xB7-",
		',': "--\xB7\xB7--",
		':': "---\xB7\xB7\xB7",
		'?': "\xB7\xB7--\xB7\xB7",
		'\'': "\xB7----\xB7",
		'-': "-\xB7\xB7\xB7\xB7-",
		'/': "-\xB7\xB7-\xB7",
		'(': "-\xB7--\xB7",
		')': "-\xB7--\xB7-",
		'\"': "\xB7-\xB7\xB7-\xB7",
		'=': "-\xB7\xB7\xB7-",
		'+': "\xB7-\xB7-\xB7",
		'\u00D7': "-\xB7\xB7-", // multiplication sign
		'@': "\xB7--\xB7-\xB7"
	};
	
	encode = function /*encode*/ (text) {
		if (typeof text !== "string")
			text = new String(text);
		text = text.toUpperCase();
		
		var code = new Array();
		var len = text.length;
		for (var i = 0; i < len; i++) {
			var char = text.charAt(i);
			var seq = encodingTable[char];
			if (seq === undefined) {
				var e = new TypeError("Character \""+ char +"\" is not available in ITU Morse Code");
				e.description = e.message;
				throw e;
			}
			code.push(seq);
		}
		return code.join(" ");
	};
	
})();