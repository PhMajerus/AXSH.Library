'
' Returns the Unicode character equivalent to the requested Commodore 64
' PETSCII character value (unshifted), like the C=64 CHR$ function.
' 
' Several of the graphical characters require a font with support for the
' Unicode 14.0 Symbols for Legacy Computing block.
' Control characters that do not have a Unicode equivalent return the
' replacement character U+FFFD, undefined values return an empty string.
' Note some characters are outside of the Unicode BMP, which means they will
' be represented by two surrogates. This function will then return a string
' of Len 2, and control characters can return complete VT control sequences.
' 
' If you want a CHR$ function like in Commodore BASIC, declare:
' Function [Chr$] (PetsciiCode): [Chr$] = CBMChr(PetsciiCode): End Function
' 
' Example, show characters, then colors:
' For Each Y In Array(32,48,64,80,96,112,160,176): S="": For X = 0 To 15: S=S & Hex(Y+X) & ":" & CBMChr(Y+X) & "  ": Next: Echo S: Next
' For Each C In Array(144,5,28,159,156,30,31,158,129,149,150,151,152,153,154,155): Echo CBMChr(C) & ChrW(&h25A0) & " " & Hex(C): Next
'

Option Explicit

Function CBMChr (PetsciiCode)
	Select Case PetsciiCode
		
		' VT colors
		Case 144: CBMChr = Chr(27)&"[38;5;16m"  ' Blk
		Case   5: CBMChr = Chr(27)&"[38;5;231m" ' Wht
		Case  28: CBMChr = Chr(27)&"[38;5;88m"  ' Red
		Case 159: CBMChr = Chr(27)&"[38;5;123m" ' Cyn
		Case 156: CBMChr = Chr(27)&"[38;5;127m" ' Pur
		Case  30: CBMChr = Chr(27)&"[38;5;34m"  ' Grn
		Case  31: CBMChr = Chr(27)&"[38;5;20m"  ' Blu
		Case 158: CBMChr = Chr(27)&"[38;5;227m" ' Yel
		Case 129: CBMChr = Chr(27)&"[38;5;173m" ' Orn
		Case 149: CBMChr = Chr(27)&"[38;5;94m"  ' Brn
		Case 150: CBMChr = Chr(27)&"[38;5;204m" ' L.Red
		Case 151: CBMChr = Chr(27)&"[38;5;59m"  ' Gry 1
		Case 152: CBMChr = Chr(27)&"[38;5;102m" ' Gry 2
		Case 153: CBMChr = Chr(27)&"[38;5;155m" ' L.Grn
		Case 154: CBMChr = Chr(27)&"[38;5;33m"  ' L.Blu
		Case 155: CBMChr = Chr(27)&"[38;5;145m" ' Gry 3
		
		' Other VT control sequences
		Case  18: CBMChr = Chr(27)&"[7m"  ' Rvs on
		Case 146: CBMChr = Chr(27)&"[27m" ' Rvs off
		Case  19: CBMChr = Chr(27)&"[H"   ' Home
		Case 145: CBMChr = Chr(27)&"[A"   ' Crsr up
		Case  17: CBMChr = Chr(27)&"[B"   ' Crsr down
		Case  29: CBMChr = Chr(27)&"[C"   ' Crsr right
		Case 157: CBMChr = Chr(27)&"[D"   ' Crsr left
		Case 147: CBMChr = Chr(27)&"[2J" & Chr(27)&"[H" ' Clr
		
		' Control characters
		Case  13: CBMChr = vbCrLf    ' Return
		Case  20: CBMChr = Chr(8)    ' Del
		Case  27: CBMChr = Chr(27)   ' Esc
		Case 141: CBMChr = ChrW(133) ' Shift return
		Case  14: CBMChr = Chr(14)   ' Lowercase + Uppercase (SO)
		Case 142: CBMChr = Chr(15)   ' Uppercase + Graphics (SI)
		
		Case 3, 8, 9, 131, 133, 134, 135, 136, 137, 138, 139, 140, 148
			' CBM Control characters without Unicode equivalents
			CBMChr = ChrW(&hFFFD) ' Replacement character
		
		Case 0, 1, 2, 4, 6, 7, 10, 11, 12, 15, 16, 21, 22, 23, 24, 25, 26, 27, 128, 130, 132, 143
			' Undefined values
			CBMChr = vbNullString
		
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
			' All other values are invalid
			Err.Raise 5
	End Select
End Function
