/*
** Acey Ducey game for ActiveScript Shell
** 
** VBScript procedure version by Philippe Majerus
** Based on original BASIC version by by Bill Palmby or Prairie View, Illinois
** It was the first game of the book Basic Computer Games, published by Creative Computing in 1978.
*/


function aceyDucey() {
	var cardName = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"];
	
	// Welcome message
	AXSH.echo();
	AXSH.echo(" \x1B[44;90m?\u2500\u2500\u2510\x1B[107m \x1B[47m \x1B[m   Acey Ducey card game");
	AXSH.echo(" \x1B[44;90m\u2502[]\u2502\x1B[107m \x1B[47m \x1B[m   Original game by Bill Palmby");
	AXSH.echo(" \x1B[44;90m\u2514\u2500\u2500?\x1B[107;30m\u2660\x1B[47;31m\u2665\x1B[m   Reprogrammed game by Philippe Majerus");
	AXSH.echo();
	
	// Rules
	AXSH.echo("Acey-Ducey is played in the following manner:");
	AXSH.echo("The dealer (computer) deals two cards face up.");
	AXSH.echo("You have an option to bet or not bet depending");
	AXSH.echo("on whether or not you feel the card will have");
	AXSH.echo("a value between the first two.");
	AXSH.echo("If you do not want to bet, input a 0.");
	
	var q = 100; // cash left
	var m; // bet amount
	var a; // first card
	var b; // second card
	var c; // third card
	
	while(true) {
		// Start round
		AXSH.echo();
		AXSH.echo("You now have " + q + " dollars.");
		AXSH.echo();
		
		// Deal two cards
		AXSH.echo("Here are your next two cards:");
		// Pick a random card for A as a number between 0 and 12
		a = Math.floor(13*Math.random());
		// Pick a random card for B, but avoid being the same value as A.
		// get a number between 0 and 11 and fix to 12 by incrementing if it's >= A.
		// We also simply swap them if B < A.
		// This avoids having to loop on generating random numbers until we are lucky
		// enough to get two with B > A like the original version did.
		b = Math.floor(12*Math.random());
		if (b >= a) {
			b++;
		} else {
			// Swap to have A be the lowest one
			var t = a;
			a = b;
			b = t;
		}
		// Show the two cards
		AXSH.echo(cardName[a]);
		AXSH.echo(cardName[b]);
		AXSH.echo();
		
		// Get player's bet
		do {
			AXSH.echo("What is your bet?");
			m = NaN;
			do {
				m = parseInt(AXSH.getLine());
			} while(isNaN(m) || (m < 0));
			if (m > q) {
				AXSH.echo();
				AXSH.echo("Sorry, my friend, but you bet too much.");
				AXSH.echo("You have only " + q + " dollars to bet.");
				m = NaN;
			}
		} while(isNaN(m));
		AXSH.echo();
		if (m === 0) {
			AXSH.echo("Chicken!!");
		} else {
			// Pick and show third card
			c = Math.floor(13*Math.random());
			AXSH.echo(cardName[c]);
			
			// Check result
			if ((c > a) && (c < b)) {
				// Won
				AXSH.echo("You win!!!");
				q += m;
			} else {
				// Lost
				AXSH.echo("Sorry, you lose");
				q -= m;
				
				if (q <= 0) {
					// Game over
					AXSH.echo();
					AXSH.echo("Sorry, friend, but you blew your wad.");
					AXSH.echo("Hope you had fun though!");
					return;
				}
			}
		}
	}
}
