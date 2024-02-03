/*
** Convert a number from pixels to points.
** Note this assumes 96 DPI screen.
*/


function pixelsToPoints (pixels) {
	// A point is 1/72 of an inch.
	// Windows at default resolution always assumes the display is 96 DPI.
	// If a scaling factor is used, the resulting value should be scaled accordingly.
	return (pixels*72)/96;
}
