/*
** A game of Bulls & Cows using VT colors
** 
** - Philippe Majerus, March 2019.
*/

function codebreaker(cColors, cHoles, cTries)
{
	if (cColors === undefined)
		cColors = 6;
	else
		cColors = Math.floor(Number(cColors));
	if (isNaN(cColors) || cColors < 1 || cColors > 9) {
		var e = new TypeError("cColors must be a number from 1 to 9, default is 6");
		e.description = e.message;
		throw e;
	}
	if (cHoles === undefined)
		cHoles = 4;
	else
		cHoles = Math.floor(Number(cHoles));
	if (isNaN(cHoles) || cHoles < 1 || cHoles > 10) {
		var e = new TypeError("cHoles must be a number from 1 to 10, default is 4");
		e.description = e.message;
		throw e;
	}
	if (cTries === undefined)
		cTries = 10;
	else
		cTries = Math.floor(Number(cTries));
	if (isNaN(cTries) || cTries < 1 || cTries > 99) {
		var e = new TypeError("cTries must be a number from 1 to 99, default is 10");
		e.description = e.message;
		throw e;
	}
	
	// Set min and max color to be used, only use holes if all colors are being used
	var minColor, maxColor;
	if (cColors == 9) {
		minColor = 0;
		maxColor = 8;
	} else {
		minColor = 1;
		maxColor = cColors;
	}
	
	var console = new ActiveXObject("Majerus.Console");
	var CHA = "\x1B[G"; // Cursor Horizontal Absolute
	var EL  = "\x1B[K"; // Erase in Line
	var SCP = "\x1B[s"; // Save Cursor Position
	var RCP = "\x1B[u"; // Restore Cursor Position
	
	// Colors to indicate codes
	var digits = [
		"\x1B[90m(0)",                  // hole
		"\x1B[94m(\x1B[34m1\x1B[94m)",  // blue
		"\x1B[92m(\x1B[32m2\x1B[92m)",  // green
		"\x1B[96m(\x1B[36m3\x1B[96m)",  // cyan
		"\x1B[91m(\x1B[31m4\x1B[91m)",  // red
		"\x1B[95m(\x1B[35m5\x1B[95m)",  // magenta
		"\x1B[93m(\x1B[33m6\x1B[93m)",  // yellow
		"\x1B[97m(\x1B[37m7\x1B[97m)",  // white
		"\x1B[90m(\x1B[37m8\x1B[90m)"   // gray
	];
	
	// Generate a random code
	function createCode() {
		var code = "";
		for (var i=0; i<cHoles; i++) {
			code += (Math.floor((Math.random()*cColors)+minColor)).toString();
		}
		return code;
	}
	
	function inputGuess() {
		var guess = ""
		console.write("Guess: " + SCP);
		var key;
		do {
			key = AXSH.getChar(false);
			var digit = parseInt(key);
			if (key == '\b') { // Backspace
				guess = guess.substr(0,guess.length-1);
				console.write(RCP + codeToString(guess) + EL);
			} else if (guess.length < cHoles && digit >= minColor && digit <= maxColor) {
				guess += digit.toString();
				console.write(RCP + codeToString(guess) + EL);
			}
		} while (!(key == '\r' && guess.length==cHoles))
		return guess;
	}
	
	// Convert a string of digits into a 
	function codeToString(code) {
		var str = "";
		var len = code.length;
		for (var i=0; i<len; i++) {
			str += digits[parseInt(code.charAt(i))];
		}
		str += "\x1B[m";
		return str;
	}
	
	// Convert a number of matches into a string of small dots
	function matchesToString(matches) {
		return ':'.repeat(matches / 2) + '.'.repeat(matches % 2);
	}
	
	// Title
	console.writeLine("\r\n \x1B[32mo\x1B[36mo\x1B[37mo\x1B[35mo\x1B[31m.\x1B[90m.\x1B[m   \x1B[91m_  _  _  _ \x1B[37m _  _  _  _     _  _\x1B[m\r\n \x1B[35mo\x1B[36mo\x1B[33mo\x1B[32mo\x1B[31m:\x1B[90m.\x1B[m  \x1B[91m| `| || \\|_`\x1B[37m|_)|_)|_`|_||_/|_`|_)\x1B[m\r\n \x1B[33mo\x1B[36mo\x1B[31mo\x1B[32mo\x1B[31m::\x1B[m  \x1B[91m|_,|_||_/|_,\x1B[37m|_)| \\|_,| || \\|_,| \\\x1B[m\r\n");
	
	// Game
	console.writeLine("Try to guess my secret code in "+ cTries +" tries or less.");
	console.writeLine("\x1B[90m("+ cHoles +" digits long, "+ minColor +" to "+ maxColor +", repeats allowed)\x1B[m\r\n");
	var code = createCode();
	var tries = 0;
	
	while (++tries <= cTries) {
		var guess = inputGuess();
		console.write(CHA + "Try#"+ (tries.toString()+" ").substr(0,2) +" " + codeToString(guess) + EL);
		
		// Compute hints
		var aCode = code.split("");
		var aGuess = guess.split("");
		var bulls = 0; // right positions
		for (var i=0; i<cHoles; i++) {
			if (aGuess[i] == aCode[i]) {
				aCode[i] = undefined;
				aGuess[i] = undefined;
				bulls++;
			}
		}
		var cows = 0; // different positions
		for (var i=0; i<cHoles; i++) {
			if (aGuess[i] != undefined) {
				for (var j=0; j<cHoles; j++) {
					if (aGuess[i] == aCode[j]) {
						aCode[j] = undefined;
						cows++;
						break;
					}
				}
			}
		}
		console.writeLine("  \x1B[91m"+ matchesToString(bulls) +"\x1B[97m"+ matchesToString(cows) +"\x1B[m \t("+ bulls.toString() +" in right position, "+ cows.toString() +" in different position)");
		
		// Check if user found secret code
		if (guess == code) {
			// Code found
			break;
		}		
	}
	
	// Check if player won or failed
	if (guess == code) {
		console.writeLine("You found my secret code in "+ tries.toString() +" tries!");
	} else {
		console.writeLine("You failed, my code was");
		console.writeLine("       " + codeToString(code) );
	}
}
