/*
** Wingdings 3 is a dingbat font for Microsoft Office.
** 
** It was an 8-bit character set, before Unicode made it possible to assign
** unique code points to each character, so normal Latin 1 characters used
** in Windows would map to Wingdings 3 symbols when that font was used.
** In 2014, Unicode 7.0 added most of these symbols as their own code points.
** 
** This function uses Unicode to provide a similar conversion, taking
** advantage of Unicode to convert Windows Latin 1 characters to Unicode
** symbols equivalents to the ones they would map to using the Wingdings 3
** font.
** Characters undefined in Wingdings 3 are mapped to the Unicode replacement
** character (U+FFFD).
*/


function wingdings3 (text) {
	var Encodings = new ActiveXObject("AXSH.Encodings");
	var wingdings3Alphabet = Encodings.SCSUBinaryToText(Encodings.Base64ToBinary("AAEBAQIBAwEEAQUBBgEHAQgJCgELAQwNAQ4BDwEQAREBEgETARQBFQEWARcBGAEZARoBGwEcAR0BHgEfIA8rYCtiK2ErYytmK2craStoK3ArcitxK3Mrdit4K3srfStkK2UraitsK2srbStNK6AroSuiK6MrpCulK6YrpyuQK5ErkiuTK4Argyt+K38rhCuGK4UrhyuPK40rjiuMK24rbyOLIyQjAyMlJCMjfSHqK7jYPtyg2D7codg+3KLYPtyj2D7cpNg+3KXYPtym2D7cp9g+3KjYPtyp2D7cqtg+3KvYPtxQ2D7cUtg+3FHYPtxT2D7cVNg+3FXYPtxX2D7cVtg+3FjYPtxZJbIlvCWzJb0lwCW2JcEltyXjJeIl5CXl2D3fgNg934LYPd+B//3YPd+DK8UrxivHK8grnCueK50rn9g+3BDYPtwS2D7cEdg+3BPYPtwU2D7cFtg+3BXYPtwX2D7cGNg+3BrYPtwZ2D7cG9g+3BzYPtwe2D7cHdg+3B/YPtwA2D7cAtg+3AHYPtwD2D7cBNg+3AbYPtwF2D7cB9g+3AjYPtwK2D7cCdg+3AvYPtwg2D7cItg+3CTYPtwm2D7cKNg+3CrYPtws2D7cnNg+3J3YPtye2D7cn9g+3C7YPtww2D7cMtg+3DTYPtw22D7cONg+3DrYPtw52D7cO9g+3JjYPtya2D7cmdg+3JvYPtw82D7cPtg+3D3YPtw/2D7cQNg+3ELYPtxB2D7cQ9g+3ETYPtxG2D7cRdg+3EcrqCupK6orqyusK60rriuv2D7cYNg+3GLYPtxh2D7cY9g+3GTYPtxl2D7cZ9g+3GbYPtxw2D7cctg+3HHYPtxz2D7cdNg+3HXYPtx32D7cdtg+3IDYPtyC2D7cgdg+3IPYPtyE2D7chdg+3IfYPtyG2D7ckNg+3JLYPtyR2D7ck9g+3JTYPtyW2D7cldg+3Jf//f/9//3//f/9//3//f/9//3//f/9//3//f/9//0="));
	return Encodings.binaryToBase256(Encodings.textToBinary(text, 1252/*Latin 1*/), wingdings3Alphabet, -1, true);
}
