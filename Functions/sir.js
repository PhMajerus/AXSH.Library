/*
** Display an ANSI-art aimed to correct users who accidentally enter sir() instead of dir().
** Original soldier ASCII-art by Joan G. Stark (JGS), ANSI-colorized by Philippe Majerus (PHM).
*/

function sir(fileNameSpecs) {
	AXSH.echo("         \x1B[32m.---.\x1B[m\r\n    \x1B[35m___ \x1B[32m/_____\\\x1B[m\r\n   \x1B[32m/\\\x1B[35m.-`( \x1B[90m'\x1B[35m.\x1B[90m'\x1B[35m )\x1B[m     Sir!\r\n  \x1B[32m/ /    \x1B[35m\\_-_/\x1B[33m_\x1B[m     Yes sir!\r\n  \x1B[32m\\ `-.-\"`'V'\x1B[33m//\x1B[32m-.\x1B[m\r\n   \x1B[32m`.__,   |\x1B[33m//\x1B[32m , \\\x1B[m\r\n       \x1B[32m|Ll \x1B[33m//\x1B[32mLl|\\ \\\x1B[m\r\n       \x1B[32m|\x1B[33m__//\x1B[32m   | \\_\\\x1B[m\r\n      \x1B[33m/---|\x1B[37m[]\x1B[90m==\x1B[32m| / /\x1B[m\r\n      \x1B[33m\\__/\x1B[32m |   \\\x1B[35m/\x1B[32m\\/\x1B[m\r\n      \x1B[32m/_   | Ll_\\\x1B[35m|\x1B[m\r\n       \x1B[32m|`^\"\"\"^`|\x1B[m\r\n       \x1B[32m|   |   |\x1B[m\r\n       \x1B[32m|   |   |\x1B[m\r\n       \x1B[32m|   |   |\x1B[m\r\n       \x1B[32m|   |   |\x1B[m\r\n       \x1B[32mL___l___J\x1B[m\r\n   \x1B[2mjgs\x1B[22m  \x1B[33m|_ | _|\x1B[m\r\n       \x1B[33m(___|___)\x1B[m");
}
