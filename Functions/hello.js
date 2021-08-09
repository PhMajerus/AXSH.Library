/*
** Simple "hello world" function
** 
** This function outputs Unicode characters that require Consolas or
** Cascadia Mono to render properly. Lucida Console will show rectangles.
*/

function hello() {
	AXSH.echo("\r\n  \x1B[37m\u039B\x1B[91mc\u00F4\u0254\x1B[m   ,-----------.\r\n \x1B[37;4;9m(\x1B[29;24m'\x1B[33m\u2022\x1B[37m'\x1B[4;9m)\x1B[29;24;37m9\x1B[m <   \x1B[3mHello to\x1B[23m  \\\r\n \x1B[37m\u00F3\x1B[91;4m/\u1D41\\\x1B[24;37m\u00B4\x1B[m   \\  \x1B[3myou too!\x1B[23m  /\r\n  \x1B[37m\u2570\u2534\u256F\x1B[m     `----------\u00B4");
}
