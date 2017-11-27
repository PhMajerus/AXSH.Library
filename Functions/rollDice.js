/*
**  Dice Roller for ActiveScript Shell with JScript
**  Shows two random numbers between 1 and 6 as ANSI-art dice.
**  
**  August 17, 2017 : Original release
**  - Philippe Majerus
*/


// Turn on strict mode for this file.
"use strict";


function rollDice() {
	// Title
	echo("\r\n  \x1B[31m\u2590\x1B[101;97m::\x1B[m  ROLL DICE \x1B[91m\u2590\x1B[101;97m\u00B7\x1B[31m\u2590\x1B[m\r\n");
	
	var aFaces = [
		/* 1 */ [
			"\x1B[97m\u2584\x1B[95m\u2584\u2584\u2584\u2584\u2584\x1B[35m\u2584\x1B[m",
			"\x1B[95;101m\u258C     \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C  \x1B[97m\u2022  \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C     \x1B[31m\u2590\x1B[m",
			"\x1B[35m\u2580\x1B[31m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[m"
			],
		/* 2 */ [
			"\x1B[97m\u2584\x1B[95m\u2584\u2584\u2584\u2584\u2584\x1B[35m\u2584\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m    \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C     \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022    \x1B[31m\u2590\x1B[m",
			"\x1B[35m\u2580\x1B[31m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[m"
			],
		/* 3 */ [
			"\x1B[97m\u2584\x1B[95m\u2584\u2584\u2584\u2584\u2584\x1B[35m\u2584\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022    \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m  \u2022  \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m    \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[35m\u2580\x1B[31m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[m"
			],
		/* 4 */ [
			"\x1B[97m\u2584\x1B[95m\u2584\u2584\u2584\u2584\u2584\x1B[35m\u2584\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C     \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[35m\u2580\x1B[31m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[m"
			],
		/* 5 */ [
			"\x1B[97m\u2584\x1B[95m\u2584\u2584\u2584\u2584\u2584\x1B[35m\u2584\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m  \u2022  \x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[35m\u2580\x1B[31m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[m"
			],
		/* 6 */ [
			"\x1B[97m\u2584\x1B[95m\u2584\u2584\u2584\u2584\u2584\x1B[35m\u2584\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[95;101m\u258C\x1B[97m\u2022   \u2022\x1B[31m\u2590\x1B[m",
			"\x1B[35m\u2580\x1B[31m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[m"
			]
	];
	var aValues = [,"Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven",]; // 2 and 12 can only be doubles.
	var aDoubles = ["Snake eyes.","Double twos.","Double threes.","Eight. Double fours.","Double fives makes ten.","Twelve. Box cars."];
	
	var d1 = Math.floor(Math.random() * 6);
	var d2 = Math.floor(Math.random() * 6);
	var f1 = aFaces[d1];
	var f2 = aFaces[d2];
	for (var l = 0; l<5; l++)
		echo("   " + f1[l] + "   " + f2[l]);
	echo();
	
	if (d1 == d2)
		echo("  " + aDoubles[d1]);
	else
		switch(Math.floor(Math.random() * 3)) {
			case 0:
				echo("  " + aValues[d1+d2] + ".");
				break;
			case 1:
				echo("  You got a " + aValues[d1+d2].toLowerCase() + ".");
				break;
			case 2:
				echo("  You rolled a " + aValues[d1+d2].toLowerCase() + ".");
				break;
		}
	
	echo();
}
