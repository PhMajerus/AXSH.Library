/*
** A game of Bulls & Cows using VT colors
** 
** - Philippe Majerus, March 2019.
*/

function codebreaker()
{
	var console = new ActiveXObject("Majerus.Console");
	var CHA = "\x1B[G"; // Cursor Horizontal Absolute
	var EL  = "\x1B[K"; // Erase in Line
	var SCP = "\x1B[s"; // Save Cursor Position
	var RCP = "\x1B[u"; // Restore Cursor Position
	
	// Pegs to indicate code or guesses
	var digits = [
		"\x1B[90m(\x1B[37m0\x1B[90m)",
		"\x1B[94m(\x1B[34m1\x1B[94m)",
		"\x1B[92m(\x1B[32m2\x1B[92m)",
		"\x1B[96m(\x1B[36m3\x1B[96m)",
		"\x1B[91m(\x1B[31m4\x1B[91m)",
		"\x1B[95m(\x1B[35m5\x1B[95m)",
		"\x1B[93m(\x1B[33m6\x1B[93m)"
	];
	
	// Dots to indicate matches
	var reports = ["", ".", ":", ":.", "::"];
	
	function createCode() {
		var code = "";
		for (var i=0; i<4; i++) {
			code += (Math.floor((Math.random()*6)+1)).toString();
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
			if (key == '\b') {
				guess = guess.substr(0,guess.length-1);
				console.write(RCP + codeToString(guess) + EL);
			} else if (guess.length < 4 && digit >= 1 && digit <= 6) {
				guess += digit.toString();
				console.write(RCP + codeToString(guess) + EL);
			}
		} while (!(key == '\r' && guess.length==4))
		return guess;
	}
	
	function codeToString(code) {
		var str = "";
		var len = code.length;
		for (var i=0; i<len; i++) {
			str += digits[parseInt(code.charAt(i))];
		}
		str += "\x1B[m";
		return str;
	}
	
	// Title
	console.writeLine("\r\n\x1B[97m>\x1B[37m>\x1B[91mCODE \x1B[37m(?)(?)(?)(?) \x1B[97mBREAKER\x1B[31m<\x1B[91m<\x1B[m\r\n");
	
	// Game
	console.writeLine("Try to guess my secret code in less than 10 tries.");
	console.writeLine("\x1B[90m(4 digits long, 1 to 6, repeats allowed)\x1B[m\r\n");
	var code = createCode();
	var tries = 0;
	
	while (++tries < 10) {
		var guess = inputGuess();
		console.write(CHA + "Try#"+tries.toString()+"  " + codeToString(guess) + EL);
		
		// Compute hints
		var aCode = code.split("");
		var aGuess = guess.split("");
		var bulls = 0; // right positions
		for (var i=0; i<4; i++) {
			if (aGuess[i] == aCode[i]) {
				aCode[i] = undefined;
				aGuess[i] = undefined;
				bulls++;
			}
		}
		var cows = 0; // different positions
		for (var i=0; i<4; i++) {
			if (aGuess[i] != undefined) {
				for (var j=0; j<4; j++) {
					if (aGuess[i] == aCode[j]) {
						aCode[j] = undefined;
						cows++;
						break;
					}
				}
			}
		}
		console.writeLine("  \x1B[91m" + reports[bulls]+"\x1B[97m"+reports[cows]+"\x1B[m ("+ bulls.toString() +" in right position, "+ cows.toString() +" in different position)");
		
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
