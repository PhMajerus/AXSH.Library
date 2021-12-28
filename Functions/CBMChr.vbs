'
' Returns the Unicode character equivalent to the requested Commodore 64
' PETSCII character value (unshifted), like the C=64 CHR$ function.
' 
' Several of the graphical characters require a font with support for the
' Unicode 14.0 Symbols for Legacy Computing block.
' Control characters that do not have a Unicode equivalent return the
' replacement character U+FFFD.
' Note some characters are outside of the Unicode BMP, which means they will
' be represented by two surrogates. This function will then return a string
' of Len 2.
'

Option Explicit

Function CBMChr (PetsciiCode)
	Select Case PetsciiCode
		Case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, _
		     16, 18, 19, 21, 22, 23, 24, 25, 26, 28, 29, 30, 31
			' CBM Control characters without Unicode equivalents, part.1
			CBMChr = ChrW(&hFFFD) ' Replacement character
		
		Case 13: CBMChr = ChrW(133)
		Case 14: CBMChr = Chr(14)
		Case 17: CBMChr = ChrW(132)
		Case 20: CBMChr = Chr(8)
		Case 27: CBMChr = Chr(27)
		
		Case 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, _
		     48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, _
		     64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, _
		     80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 93
			' Identical to ASCII
			CBMChr = Chr(PetsciiCode)
		
		Case 92: CBMChr = ChrW(163)
		Case 94: CBMChr = ChrW(&h2191)
		Case 95: CBMChr = ChrW(&h2190)
		
		Case  96, 192: CBMChr = ChrW(&hD83E)&ChrW(&hDF79)
		Case  97, 193: CBMChr = ChrW(&h2660)
		Case  98, 194: CBMChr = ChrW(&hD83E)&ChrW(&hDF72)
		Case  99, 195: CBMChr = ChrW(&hD83E)&ChrW(&hDF78)
		Case 100, 196: CBMChr = ChrW(&hD83E)&ChrW(&hDF77)
		Case 101, 197: CBMChr = ChrW(&hD83E)&ChrW(&hDF76)
		Case 102, 198: CBMChr = ChrW(&hD83E)&ChrW(&hDF7A)
		Case 103, 199: CBMChr = ChrW(&hD83E)&ChrW(&hDF71)
		Case 104, 200: CBMChr = ChrW(&hD83E)&ChrW(&hDF74)
		Case 105, 201: CBMChr = ChrW(&h256E)
		Case 106, 202: CBMChr = ChrW(&h2570)
		Case 107, 203: CBMChr = ChrW(&h256F)
		Case 108, 204: CBMChr = ChrW(&hD83E)&ChrW(&hDF7C)
		Case 109, 205: CBMChr = ChrW(&h2572)
		Case 110, 206: CBMChr = ChrW(&h2571)
		Case 111, 207: CBMChr = ChrW(&hD83E)&ChrW(&hDF7D)
		
		Case 112, 208: CBMChr = ChrW(&hD83E)&ChrW(&hDF7E)
		Case 113, 209: CBMChr = ChrW(&h25CF)
		Case 114, 210: CBMChr = ChrW(&hD83E)&ChrW(&hDF7B)
		Case 115, 211: CBMChr = ChrW(&h2665)
		Case 116, 212: CBMChr = ChrW(&hD83E)&ChrW(&hDF70)
		Case 117, 213: CBMChr = ChrW(&h256D)
		Case 118, 214: CBMChr = ChrW(&h2573)
		Case 119, 215: CBMChr = ChrW(&h25CB)
		Case 120, 216: CBMChr = ChrW(&h2663)
		Case 121, 217: CBMChr = ChrW(&hD83E)&ChrW(&hDF75)
		Case 122, 218: CBMChr = ChrW(&h2666)
		Case 123, 219: CBMChr = ChrW(&h253C)
		Case 124, 220: CBMChr = ChrW(&hD83E)&ChrW(&hDF8C)
		Case 125, 221: CBMChr = ChrW(&h2502)
		Case 126, 222: CBMChr = ChrW(&h03C0)
		Case 127, 223: CBMChr = ChrW(&h25E5)
		
		Case 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 143, _
		     144, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159
			' CBM Control characters without Unicode equivalents, part.2
			CBMChr = ChrW(&hFFFD) ' Replacement character
		
		Case 141: CBMChr = vbLf
		Case 142: CBMChr = Chr(15)
		Case 145: CBMChr = ChrW(141)
		
		Case 160, 224: CBMChr = ChrW(160)
		Case 161, 225: CBMChr = ChrW(&h258C)
		Case 162, 226: CBMChr = ChrW(&h2584)
		Case 163, 227: CBMChr = ChrW(&h2594)
		Case 164, 228: CBMChr = ChrW(&h2581)
		Case 165, 229: CBMChr = ChrW(&h258F)
		Case 166, 230: CBMChr = ChrW(&h2592)
		Case 167, 231: CBMChr = ChrW(&h2595)
		Case 168, 232: CBMChr = ChrW(&hD83E)&ChrW(&hDF8F)
		Case 169, 233: CBMChr = ChrW(&h25E4)
		Case 170, 234: CBMChr = ChrW(&hD83E)&ChrW(&hDF87)
		Case 171, 235: CBMChr = ChrW(&h251C)
		Case 172, 236: CBMChr = ChrW(&h2597)
		Case 173, 237: CBMChr = ChrW(&h2514)
		Case 174, 238: CBMChr = ChrW(&h2510)
		Case 175, 239: CBMChr = ChrW(&h2582)
		
		Case 176, 240: CBMChr = ChrW(&h250C)
		Case 177, 241: CBMChr = ChrW(&h2534)
		Case 178, 242: CBMChr = ChrW(&h252C)
		Case 179, 243: CBMChr = ChrW(&h2524)
		Case 180, 244: CBMChr = ChrW(&h258E)
		Case 181, 245: CBMChr = ChrW(&h258D)
		Case 182, 246: CBMChr = ChrW(&hD83E)&ChrW(&hDF88)
		Case 183, 247: CBMChr = ChrW(&hD83E)&ChrW(&hDF82)
		Case 184, 248: CBMChr = ChrW(&hD83E)&ChrW(&hDF83)
		Case 185, 249: CBMChr = ChrW(&h2583)
		Case 186, 250: CBMChr = ChrW(&hD83E)&ChrW(&hDF7F)
		Case 187, 251: CBMChr = ChrW(&h2596)
		Case 188, 252: CBMChr = ChrW(&h259D)
		Case 189, 253: CBMChr = ChrW(&h2518)
		Case 190, 254: CBMChr = ChrW(&h2598)
		Case 191:      CBMChr = ChrW(&h259A)
		Case 255:      CBMChr = ChrW(&h03C0)
		
		Case Else
			Err.Raise 5
	End Select
End Function
