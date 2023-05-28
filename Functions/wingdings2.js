/*
** Wingdings 2 is a dingbat font for Microsoft Office.
** 
** It was an 8-bit character set, before Unicode made it possible to assign
** unique code points to each character, so normal Latin 1 characters used
** in Windows would map to Wingdings 2 symbols when that font was used.
** In 2014, Unicode 7.0 added most of these symbols as their own code points.
** 
** This function uses Unicode to provide a similar conversion, taking
** advantage of Unicode to convert Windows Latin 1 characters to Unicode
** symbols equivalents to the ones they would map to using the Wingdings 2
** font.
** Characters undefined in Wingdings 2 are mapped to the Unicode replacement
** character (U+FFFD).
*/


function wingdings2 (text) {
	var Encodings = new ActiveXObject("AXSH.Encodings");
	var wingdings2Alphabet = Encodings.SCSUBinaryToText(Encodings.Base64ToBinary("AAEBAQIBAwEEAQUBBgEHAQgJCgELAQwNAQ4BDwEQAREBEgETARQBFQEWARcBGAEZARoBGwEcAR0BHgEfIA/YPd2K2D3di9g93YzYPd2NJwQnANg93X7YPd192D3dxdg93cbYPd3H2D3dyNg93cnYPd3K2D3dy9g93czYPd3N2D3cy9g93dHYPd3U2D3dtdg93bbYPd232D3duNg93a3YPd2v2D3dsdg93ZLYPd2T2D3dmNg93ZnYPd2a2D3dm9g93EjYPdxJ2D3dnNg93Z3YPd2e2D3dn9g93aDYPd2h2D3cRtg93EfYPd2i2D3do9g93ZHYPd302D3d+Ng93fUmESu9JhIrviu/2D3exym42D3ecdg93nTYPd5y2D3ecyA92D3eedg93nrYPd572D3eZtg93mTYPd5l2D3eZ9g93lrYPd5Y2D3eWdg93lsk6iRgJGEkYiRjJGQkZSRmJGckaCRpJP8ndid3J3gneSd6J3snfCd9J34nf//9JgnYPN8VJj0mPi4/Jx3YPd1H2D3dXNg93V3YPd1e2D3dX9g93WDYPd1h2D3dYtg93WPYPd1k2D3dZdg93WbYPd1n2D3eaNg93mkixdg934QpgSXPJcvYPd+F2D3fh9g934kimSm/2D3fjNg9340l/iWgJaHYPd+R2D3fktg935PYPd+UJaPYPd+V2D3fltg935fYPd+YKykrJSXH2D3fmiXI2D3fm9g935zYPd+d2D3fnisqKyclytg936Al1iXXK8oryyvAK8ErHyvCKyMrIivDK8TYPd+h2D3fotg936PYPd+k2D3fpdg936bYPd+n2D3fqNg936nYPd+q2D3fq9g936zYPd+t2D3frtg936/YPd+w2D3fsdg937LYPd+z2D3ftNg937XYPd+22D3ft9g937jYPd+52D3futg937vYPd+82D3fvdg9377YPd+/2D3fwNg938LYPd/E2D3fxtg938nYPd/KJzbYPd/M2D3fztg939DYPd/SJznYPd/D2D3fxycv2D3fzdg939QrzCvNIDsgQv/9//3//f/9//3//Q=="));
	return Encodings.binaryToBase256(Encodings.textToBinary(text, 1252/*Latin 1*/), wingdings2Alphabet, -1, true);
}
