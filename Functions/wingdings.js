/*
** Wingdings is the original dingbat font for Windows 3.1 and later.
** 
** It was an 8-bit character set, before Unicode made it possible to assign
** unique code points to each character, so normal Latin 1 characters used
** in Windows would map to Wingdings symbols when that font was used.
** In 2014, Unicode 7.0 added most of these symbols as their own code points.
** 
** This function uses Unicode to provide a similar conversion, taking
** advantage of Unicode to convert Windows Latin 1 characters to Unicode
** symbols equivalents to the ones they would map to using the Wingdings
** font.
** The Wingdings character assigned to the Microsoft Windows logo (0xFF) is
** mapped to the first Unicode Private Use Area (PUA) character for corporate
** use U+F8FF. Note fonts usually do not contain that character, or could use
** it for another corporate use character.
*/


function wingdings (text) {
	var Encodings = new ActiveXObject("AXSH.Encodings");
	var wingdingsAlphabet = Encodings.SCSUBinaryToText(Encodings.Base64ToBinary("AAEBAQIBAwEEAQUBBgEHAQgJCgELAQwNAQ4BDwEQAREBEgETARQBFQEWARcBGAEZARoBGwEcAR0BHgEfIA/YPd2JJwInAdg93FPYPd1t2D3dbtg93W/YPd1/JwbYPd2C2D3dg9g93OrYPdzr2D3c7Ng93O3YPd3A2D3dwdg93c7YPd3P2D3d0Ng93cQjG9g93a7YPd2w2D3dstg93bPYPd202D3dq9g93awnBycN2D3djicM2D3dj9g93E3YPdxOJhwmHiYdJh/YPd2QJjrYPd4QJjnYPdyj2D3dcdg83/PYPN/xJwgmPNg83yInRNg93UYnHtg93UgnICchJiomL9g93UkmOCZIJkkmSiZLJkwmTSZOJk8mUCZRJlImU9g93nDYPd51JqvYPd0+JfzYPd+P2D3fkCdRJ1LYPd+fKeslxidWKykjJyu5IxjYPN/12Dzf9tg93nbYPd53Ja/YPN0LJ4AngSeCJ4MnhCeFJ4YnhyeIJ4nYPN0MJ4oniyeMJ40njiePJ5AnkSeSJ5PYPd5i2D3eYNg93mHYPd5j2D3eXtg93lzYPd5d2D3eXyIZICIrHStY2D3fhtg934jYPd+K2D3fi9g93T8lqtg9347YPd/B2D3fxSYF2D3fy9g938/YPd/T2D3f0SvQIxYrzivPK9EnKicw2D3dUNg93VHYPd1S2D3dU9g93VTYPd1V2D3dVtg93VfYPd1Y2D3dWdg93VrYPd1bK7ArsSuyK7MrtCu1K7Yrt9g93mrYPd5r2D3eVdg93lTYPd5X2D3eVtg93lDYPd5R2D3eUtg93lMjKyMmK5grmiuZK5sriCuKK4kri9g+3GjYPtxq2D7cadg+3GvYPtxs2D7cbdg+3G/YPtxu2D7ceNg+3HrYPtx52D7ce9g+3HzYPtx92D7cf9g+3H4h5iHoIech6SsEIfMrASsAKwMrAtg+3KzYPtyt2D3d9icT2D3d99g93fn4/w=="));
	return Encodings.binaryToBase256(Encodings.textToBinary(text, 1252/*Latin 1*/), wingdingsAlphabet);
}
