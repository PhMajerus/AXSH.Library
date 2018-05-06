/* 
** Draw Cards for ActiveScript Shell with JScript.
** Shows random cards from a standard 52-cards deck.
** 
** - Philippe Majerus, January 2018.
*/ 

function drawCards(cCards) {
	// Prepare 52-cards deck
	var deck = [
		/* Spade */
		/*A*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mA    \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2660  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m    A\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*2*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m2 \u2660  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2660 2\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*3*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m3 \u2660  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2660  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2660 3\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*4*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m4\u2660 \u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u26604\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*5*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m5\u2660 \u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2660  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u26605\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*6*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m6\u2660 \u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u26606\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*7*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m7\u2660\u2660\u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u26607\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*8*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m8\u2660\u2660\u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660 \u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660\u2660\u26608\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*9*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m9\u2660\u2660\u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660\u2660\u2660 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2660\u2660\u26609\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*X*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m10\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2502\u2660\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2514\u250010\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*J*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mJ\u2660\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[30m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[30m\u2660J\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*Q*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mQ\u2660\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[30m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[30m\u2660Q\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*K*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mK\u2660\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[30m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[30m\u2660K\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/* Heart */
		/*A*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mA    \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2665  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m    A\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*2*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m2 \u2665  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2665 2\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*3*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m3 \u2665  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2665  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2665 3\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*4*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m4\u2665 \u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u26654\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*5*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m5\u2665 \u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2665  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u26655\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*6*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m6\u2665 \u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u26656\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*7*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m7\u2665\u2665\u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u26657\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*8*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m8\u2665\u2665\u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665 \u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665\u2665\u26658\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*9*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m9\u2665\u2665\u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665\u2665\u2665 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2665\u2665\u26659\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*X*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m10\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2502\u2665\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2514\u250010\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*J*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mJ\u2665\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[31m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[31m\u2665J\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*Q*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mQ\u2665\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[31m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[31m\u2665Q\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*K*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mK\u2665\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[31m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[31m\u2665K\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/* Diamond */
		/*A*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mA    \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2666  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m    A\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*2*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m2 \u2666  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2666 2\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*3*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m3 \u2666  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2666  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2666 3\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*4*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m4\u2666 \u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u26664\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*5*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m5\u2666 \u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m  \u2666  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u26665\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*6*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m6\u2666 \u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u26666\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*7*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m7\u2666\u2666\u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u26667\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*8*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m8\u2666\u2666\u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666 \u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666\u2666\u26668\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*9*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m9\u2666\u2666\u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666\u2666\u2666 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2666\u2666\u26669\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*X*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31m10\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2502\u2666\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[31m \u2514\u250010\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*J*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mJ\u2666\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[31m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[31m\u2666J\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*Q*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mQ\u2666\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[31m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[31m\u2666Q\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*K*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[31mK\u2666\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[31m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[31m\u2666K\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/* Club */
		/*A*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mA    \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2663  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m    A\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*2*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m2 \u2663  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2663 2\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*3*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m3 \u2663  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2663  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2663 3\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*4*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m4\u2663 \u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m     \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u26634\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*5*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m5\u2663 \u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m  \u2663  \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u26635\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*6*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m6\u2663 \u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u26636\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*7*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m7\u2663\u2663\u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u26637\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*8*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m8\u2663\u2663\u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663 \u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663\u2663\u26638\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*9*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m9\u2663\u2663\u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663\u2663\u2663 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2663\u2663\u26639\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*X*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30m10\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2502\u2663\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502\x1B[30m \u2514\u250010\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*J*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mJ\u2663\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[30m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[30m\u2663J\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*Q*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mQ\u2663\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[30m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[30m\u2663Q\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"],
		/*K*/ ["\x1B[107;37m\u250C\u2500\u2500\u2500\u2500\u2500\u2510\x1B[m", "\x1B[107;37m\u2502\x1B[30mK\u2663\x1B[94m\u2500\u2510 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2502\x1B[30m/\x1B[94m\u2502 \x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2502 \x1B[94m\u2514\u2500\x1B[30m\u2663K\x1B[37m\u2502\x1B[m", "\x1B[107;37m\u2514\u2500\u2500\u2500\u2500\u2500\u2518\x1B[m"]
	];
	
	if ((cCards === undefined) || (cCards < 1) || (cCards > deck.length)) {
		var e = new TypeError("cCards must be between 1 and "+ deck.length );
		e.description = e.message;
		throw e;
	}
	
	// Build hand
	var hand = [];
	for (var i = 0; i < cCards; i++) {
		// pick a card in deck
		var ci = Math.floor(Math.random()*deck.length);
		// move card to hand
		hand.push (deck.splice(ci,1)[0]);
	}
	
	// Show hand
	var a = new Array(5);
	for (var l = 0; l<5; l++) {
		a[l] = "";
		for (var i = 0; i < hand.length; i++) {
			a[l] += " " + hand[i][l];
		}
	}
	AXSH.echo(a.join("\r\n"));
}
