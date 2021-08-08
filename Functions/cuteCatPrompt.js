/*
** A novelty prompt featuring a cute cat with a red bow.
** 
** This prompt requires Consolas, Cascadia Mono, or another font with Unicode
** characters. Lucida Console does not contain all the characters required to
** display it.
** 
** Use by assigning to the prompt function as follows:
** prompt = cuteCatPrompt;
*/


function cuteCatPrompt() {
	return "\x1B[m\r\n" +
		" \u039B\x1B[91mc\u00F4\u0254\x1B[m\r\n" +
		"\x1B[4;9m(\x1B[29;24m'\x1B[33m\u2022\x1B[m'\x1B[4;9m)\x1B[m  " + AXSH.location.path + "\r\n" +
		"\x1B[91;4m/\u203E\u1D41\u203E\\\x1B[m  > ";
}
