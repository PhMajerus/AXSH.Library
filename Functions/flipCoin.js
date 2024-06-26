/*
**  Flip a Coin for ActiveScript Shell with JScript
**  Shows a random boolean as an ANSI-art coin.
**  
**  June 27, 2024 : Changed from registry country lookup to Location API.
**  August 18, 2017 : Added support for country-specific coins and EUR coin ANSI-art
**  August 17, 2017 : Original release with US coin ANSI-art
**  - Philippe Majerus
*/

// Turn on strict mode for this file.
"use strict";

function flipCoin() {
	// Title
	echo("  \x1B[4;37m \x1B[24m                 \x1B[4m \x1B[24m\x1B[m\r\n \x1B[97m(\x1B[4;37m\u263A\x1B[24;90m)\x1B[m  FLIP A COIN  \x1B[97m(\x1B[4;37m\u00A2\x1B[24;90m)\x1B[m\r\n");
	
	// Check if the current country or region is part of the Eurozone to use EUR coin, or if we should default to USD coin.
	var countryCode = getCountryCode();
	if(["AT","BE","HR","CY","EE","FI","FR","DE","GR","IE","IT","LV","LT","LU","MT","NL","PT","SK","SI","ES"].indexOf(countryCode)!=-1) {
		if (Math.random() < .5) {
			// Tails (1 EUR coin)
			echo("       \x1B[33m\u2584\x1B[47m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[49m\u2584\x1B[m");
			echo("      \x1B[33;47m\u2588 \x1B[30m_\x1B[97m'\x1B[30m/\x1B[90m.|||\x1B[33m\u2588\x1B[m");
			echo("     \x1B[33m\u2590\x1B[47m\u258C \x1B[97m/\x1B[30m/ \x1B[90mEURO\x1B[33m\u2590\x1B[49m\u258C\x1B[m");
			echo("      \x1B[33;47m\u2588\x1B[97m/\x1B[30;4m/\x1B[24;90m  '|||\x1B[33m\u2588\x1B[m");
			echo("       \x1B[33m\u2580\x1B[47m\u2584\u2584\u2584\u2584\u2584\u2584\x1B[49m\u2580\x1B[m");
			echo();
			echo("  It's coming up tails.");
		} else {
			// Heads (1 EUR coin)
			echo("       \x1B[33m\u2584\x1B[47m\u2580\u2580\u2580\u2580\u2580\u2580\x1B[49m\u2584\x1B[m");
			echo("      \x1B[33;47m\u2588 \x1B[97m/\x1B[90m\"\"7\x1B[30;4m\\\x1B[24m  \x1B[33m\u2588\x1B[m");
			echo("     \x1B[33m\u2590\x1B[47m\u258C\x1B[97m(\x1B[90m__C \u00B0\x1B[4;30m\\\x1B[24;33m \u2590\x1B[49m\u258C\x1B[m");
			echo("      \x1B[33;47m\u2588 \x1B[97;4m)\x1B[24;90m_\\_\x1B[30m_\x1B[90m\u0192 \x1B[33m\u2588\x1B[m");
			echo("       \x1B[33m\u2580\x1B[47m\u2584\u2584\u2584\u2584\u2584\u2584\x1B[49m\u2580\x1B[m");
			echo();
			echo("  Heads it is.");
		}
	} else { // "United States", and currently no specific coin for Switzerland/Liechtenstein, China, Japan, ...
		if (Math.random() < .5) {
			// Tails (25c US coin)
			echo("       \x1B[37m\u2584\x1B[100m\u2580\u2580\x1B[4m\u2580\x1B[24m\u2580\u2580\u2580\x1B[49m\u2584\x1B[m");
			echo("      \x1B[37;100m\u2588 \x1B[97m/\x1B[30m\\\x1B[97m2\x1B[30m|\x1B[97m/\x1B[30m\\\x1B[37m \u2588\x1B[m");
			echo("     \x1B[37m\u2590\x1B[100m\u258C\x1B[97m(\x1B[37m \x1B[37;4m^\x1B[24;97m}\x1B[30m{\x1B[37;4m^\x1B[24;37m \x1B[30m)\x1B[37m\u2590\x1B[49m\u258C\x1B[m");
			echo("      \x1B[37;100m\u2588 W\x1B[97;4m-\x1B[37m\"\"\x1B[30m-\x1B[24m\x1B[37mW \u2588\x1B[m");
			echo("       \x1B[37m\u2580\x1B[100m\u2584\u2584\u2584\u2584\u2584\u2584\x1B[49m\u2580\x1B[m");
			echo();
			echo("  It's coming up tails.");
		} else {
			// Heads (25c US coin)
			echo("       \x1B[37m\u2584\x1B[100m\u2580\x1B[4m\u2580\u2580\u2580\x1B[24m\u2580\u2580\x1B[49m\u2584\x1B[m");
			echo("      \x1B[37;100m\u2588 \x1B[97m/\x1B[30m_\x1B[37m\u2580\u2593\u2592\x1B[30m\u2592\x1B[37m \u2588\x1B[m");
			echo("     \x1B[37m\u2590\x1B[100m\u258C\x1B[97;4m/\x1B[37;24m\u00B0 )\u2593\u2593\u2592\x1B[30m\u2591\x1B[37m\u2590\x1B[49m\u258C\x1B[m");
			echo("      \x1B[37;100m\u2588 \x1B[97mE\x1B[37m_\x1B[30m/\x1B[97;4m/\x1B[37m \x1B[30m(\x1B[24;37m \u2588\x1B[m");
			echo("       \x1B[37m\u2580\x1B[100m\u2584\u2584\u2584\u2584\u2584\u2584\x1B[49m\u2580\x1B[m");
			echo();
			echo("  Heads it is.");
		}
	}
	
	echo();
}
