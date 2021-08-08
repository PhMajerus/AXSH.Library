/*
** A novelty prompt featuring a cute cat with a red bow.
** Any similarity to a well known character is purely coincidental.
** 
** This prompt requires Consolas, Cascadia Mono, or another font with Unicode
** characters. Lucida Console does not contain all the characters required to
** display it.
** 
** Use by assigning to the prompt function as follows:
** prompt = cuteCatPrompt;
*/


function cuteCatPrompt() {
	return "\r\n" +
		" \x1B[37m\u039B\x1B[91mc\u00F4\u0254\x1B[m\r\n" +
		"\x1B[37;4;9m(\x1B[29;24m'\x1B[33m\u2022\x1B[37m'\x1B[4;9m)\x1B[m  " + AXSH.location.path + "\r\n" +
		"\x1B[37m\u00F3\x1B[91;4m/\u1D41\\\x1B[24;37m\u00F2\x1B[m  > ";
}
