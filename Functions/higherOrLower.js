/*
** Higher or Lower game for Majerus.net ActiveScript Shell with JScript
** Philippe Majerus, July 10, 2017
*/

// Turn on strict mode for this file.
"use strict";

function higherOrLower() {
	echo("\r\n  \x1B[92m/\\\x1B[31m\u2502\x1B[91m\u2502    \x1B[92m)_/'_ / _ _\x1B[m\r\n \x1B[92m/\x1B[32m__\x1B[92m\\\x1B[31m\u203E\x1B[91m/  \x1B[92m/ //(//)(-/   \x1B[91m/      \x1B[91m_ _\x1B[m\r\n  \x1B[92m\u2502\u2502\x1B[31m\\\x1B[91m/      \x1B[92m_/     \x1B[90mor \x1B[91m(_()((/(-/\x1B[m\r\n");
	
	// Pick a random number between 1 and 100
	var number = Math.floor((Math.random() * 100) + 1);
	
	var tries = 0;
	var prompts = ["Make your first guess.","Make your second guess.","Make your third guess.","Make your fourth guess.","Make your fifth guess. \x1B[90m\u266A\x1B[m","Make you sixth and last guess. \x1B[90m\u266B\x1B[m"];
	
	echo("I'm thinking of a number between 1 and 100.");
	echo("Try to guess my number in six tries at most.");
	
	while (tries++ < 6) {
		echo();
		echo("\x1B[94m?\x1B[m " + prompts[tries-1]);
		
		// Get a valid input from the user
		var guess;
		do {
			guess = parseInt(getLine());
		} while (isNaN(guess) || (guess < 1) || (guess > 100));
		
		if (guess == number) {
			echo();
			if (tries == 1)
				echo("\x1B[93m\u263B\x1B[m Incredible! You guessed my number on your first try!");
			else
				echo("\x1B[93m\u263B\x1B[m Congratulations! You guessed my number in " + tries.toString() + " tries.");
			break;
		} else if (guess < number) {
			echo("\x1B[92m\u2191\x1B[m My number is higher than " + guess.toString() + ".");
		} else { //if (guess > number)
			echo("\x1B[91m\u2193\x1B[m My number is lower than " + guess.toString() + ".");
		}
	}
	
	if (tries > 6) {
		echo();
		echo("\x1B[95m\u2020\x1B[m You failed! My number was " + number.toString() + ".");
	}
	
	echo();
}
