/*
** An ANSI-art version of the "Congratulations, You Won!" meme
** 
** Back when Microsoft Windows was a GUI on top of MS-DOS, it was launched
** using the "WIN" command.
** This function just makes fun of that 1985-1995 decade by showing a
** version of one of the first fraudulent pop-up ads on the Web that has
** been so widespread that it got famous.
*/


function win() {
	var line = "\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500";
	AXSH.echo("\r\n" +
		" \x1B[90m\u250C" + line + "\u2510\x1B[m\r\n" +
		" \x1B[90m\u2502 \x1B[91;1;5mWINNER!    WINNER!    WINNER!\x1B[0;90m \u2502\x1B[m\r\n" +
		" \x1B[90m\u2502                               \u2502\x1B[m\r\n" +
		" \x1B[90m\u2502 \x1B[m  Congratulations, you WON!  \x1B[90m \u2502\x1B[m\r\n" +
		" \x1B[90m\u2502 \x1B[mYou are the 1,000,000th user!\x1B[90m \u2502\x1B[m\r\n" +
		" \x1B[90m\u2502  \x1B[32mc\u03A9\u0254                     \x1B[31mc\u03A9\u0254 \x1B[90m \u2502\x1B[m\r\n" +
		" \x1B[90m\u2502 \x1B[41;32m\u2550\u2550\u256C\u2550\u2550\x1B[0;5m Claim your prize! \x1B[0;42;31m\u2550\u2550\u256C\u2550\u2550\x1B[0;90m \u2502\x1B[m\r\n" +
		" \x1B[90m\u2502                               \u2502\x1B[m\r\n" +
		" \x1B[90m\u2514" + line + "\u2518\x1B[m");
}
