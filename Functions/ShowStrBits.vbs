'
' COM and VBScript strings are stored internally in UTF-16.
' This procedure shows in the console the hexadecimal representation of a
' string.
' It is designed as a learning and debugging tool to get a better
' understanding of strings' representations in memory.
' 
' Philippe Majerus, March 2020, rewritten August 2022.
'

Option Explicit

Sub ShowStrBits (Str)
	Dim CP437wC0, CSI, Text, LB, L, I, B, S, Faint
	
	' Mapping table for Codepage 437 with control characters as glyphs
	CP437wC0 = Array( _
		ChrW(&h2400), ChrW(&h2401), ChrW(&h2402), ChrW(&h2403), ChrW(&h2404), ChrW(&h2405), ChrW(&h2406), ChrW(&h2407), ChrW(&h2408), ChrW(&h2409), ChrW(&h240A), ChrW(&h240B), ChrW(&h240C), ChrW(&h240D), ChrW(&h240E), ChrW(&h240F), _
		ChrW(&h2410), ChrW(&h2411), ChrW(&h2412), ChrW(&h2413), ChrW(&h2414), ChrW(&h2415), ChrW(&h2416), ChrW(&h2417), ChrW(&h2418), ChrW(&h2419), ChrW(&h241A), ChrW(&h241B), ChrW(&h241C), ChrW(&h241D), ChrW(&h241E), ChrW(&h241F), _
		ChrW(&h0020), ChrW(&h0021), ChrW(&h0022), ChrW(&h0023), ChrW(&h0024), ChrW(&h0025), ChrW(&h0026), ChrW(&h0027), ChrW(&h0028), ChrW(&h0029), ChrW(&h002A), ChrW(&h002B), ChrW(&h002C), ChrW(&h002D), ChrW(&h002E), ChrW(&h002F), _
		ChrW(&h0030), ChrW(&h0031), ChrW(&h0032), ChrW(&h0033), ChrW(&h0034), ChrW(&h0035), ChrW(&h0036), ChrW(&h0037), ChrW(&h0038), ChrW(&h0039), ChrW(&h003A), ChrW(&h003B), ChrW(&h003C), ChrW(&h003D), ChrW(&h003E), ChrW(&h003F), _
		ChrW(&h0040), ChrW(&h0041), ChrW(&h0042), ChrW(&h0043), ChrW(&h0044), ChrW(&h0045), ChrW(&h0046), ChrW(&h0047), ChrW(&h0048), ChrW(&h0049), ChrW(&h004A), ChrW(&h004B), ChrW(&h004C), ChrW(&h004D), ChrW(&h004E), ChrW(&h004F), _
		ChrW(&h0050), ChrW(&h0051), ChrW(&h0052), ChrW(&h0053), ChrW(&h0054), ChrW(&h0055), ChrW(&h0056), ChrW(&h0057), ChrW(&h0058), ChrW(&h0059), ChrW(&h005A), ChrW(&h005B), ChrW(&h005C), ChrW(&h005D), ChrW(&h005E), ChrW(&h005F), _
		ChrW(&h0060), ChrW(&h0061), ChrW(&h0062), ChrW(&h0063), ChrW(&h0064), ChrW(&h0065), ChrW(&h0066), ChrW(&h0067), ChrW(&h0068), ChrW(&h0069), ChrW(&h006A), ChrW(&h006B), ChrW(&h006C), ChrW(&h006D), ChrW(&h006E), ChrW(&h006F), _
		ChrW(&h0070), ChrW(&h0071), ChrW(&h0072), ChrW(&h0073), ChrW(&h0074), ChrW(&h0075), ChrW(&h0076), ChrW(&h0077), ChrW(&h0078), ChrW(&h0079), ChrW(&h007A), ChrW(&h007B), ChrW(&h007C), ChrW(&h007D), ChrW(&h007E), ChrW(&h2421), _
		ChrW(&h00C7), ChrW(&h00FC), ChrW(&h00E9), ChrW(&h00E2), ChrW(&h00E4), ChrW(&h00E0), ChrW(&h00E5), ChrW(&h00E7), ChrW(&h00EA), ChrW(&h00EB), ChrW(&h00E8), ChrW(&h00EF), ChrW(&h00EE), ChrW(&h00EC), ChrW(&h00C4), ChrW(&h00C5), _
		ChrW(&h00C9), ChrW(&h00E6), ChrW(&h00C6), ChrW(&h00F4), ChrW(&h00F6), ChrW(&h00F2), ChrW(&h00FB), ChrW(&h00F9), ChrW(&h00FF), ChrW(&h00D6), ChrW(&h00DC), ChrW(&h00A2), ChrW(&h00A3), ChrW(&h00A5), ChrW(&h20A7), ChrW(&h0192), _
		ChrW(&h00E1), ChrW(&h00ED), ChrW(&h00F3), ChrW(&h00FA), ChrW(&h00F1), ChrW(&h00D1), ChrW(&h00AA), ChrW(&h00BA), ChrW(&h00BF), ChrW(&h2310), ChrW(&h00AC), ChrW(&h00BD), ChrW(&h00BC), ChrW(&h00A1), ChrW(&h00AB), ChrW(&h00BB), _
		ChrW(&h2591), ChrW(&h2592), ChrW(&h2593), ChrW(&h2502), ChrW(&h2524), ChrW(&h2561), ChrW(&h2562), ChrW(&h2556), ChrW(&h2555), ChrW(&h2563), ChrW(&h2551), ChrW(&h2557), ChrW(&h255D), ChrW(&h255C), ChrW(&h255B), ChrW(&h2510), _
		ChrW(&h2514), ChrW(&h2534), ChrW(&h252C), ChrW(&h251C), ChrW(&h2500), ChrW(&h253C), ChrW(&h255E), ChrW(&h255F), ChrW(&h255A), ChrW(&h2554), ChrW(&h2569), ChrW(&h2566), ChrW(&h2560), ChrW(&h2550), ChrW(&h256C), ChrW(&h2567), _
		ChrW(&h2568), ChrW(&h2564), ChrW(&h2565), ChrW(&h2559), ChrW(&h2558), ChrW(&h2552), ChrW(&h2553), ChrW(&h256B), ChrW(&h256A), ChrW(&h2518), ChrW(&h250C), ChrW(&h2588), ChrW(&h2584), ChrW(&h258C), ChrW(&h2590), ChrW(&h2580), _
		ChrW(&h03B1), ChrW(&h00DF), ChrW(&h0393), ChrW(&h03C0), ChrW(&h03A3), ChrW(&h03C3), ChrW(&h00B5), ChrW(&h03C4), ChrW(&h03A6), ChrW(&h0398), ChrW(&h03A9), ChrW(&h03B4), ChrW(&h221E), ChrW(&h03C6), ChrW(&h03B5), ChrW(&h2229), _
		ChrW(&h2261), ChrW(&h00B1), ChrW(&h2265), ChrW(&h2264), ChrW(&h2320), ChrW(&h2321), ChrW(&h00F7), ChrW(&h2248), ChrW(&h00B0), ChrW(&h2219), ChrW(&h00B7), ChrW(&h221A), ChrW(&h207F), ChrW(&h00B2), ChrW(&h25A0), ChrW(&h2420))
	
	CSI = Chr(27)&"["
	Text = CStr(Str)
	LB = LenB(Text)
	
	' Show length prefix bytes
	S = Right("00000000" & Hex(LB), 8)
	' Format them in little-endian order
	S = Right(S,2) & " " & Mid(S,5,2) & " " & Mid(S,3,2) & " " & Left(S,2)
	AXSH.Echo vbCrLf & CSI&"35mPrefix  "&CSI&"95m  " & S & CSI&"35m  (String is " & LB & " bytes long)"
	
	' Show chars bytes
	For L = 0 To LB-1 Step 16
		' Line offset
		S = CSI&"90m" & Right("00000000" & Hex(L), 8) & CSI&"m "
		
		' Prepare bytes values
		Faint = False
		For I = 0 To 15
			If L+I >= LB Then Exit For
			B = AscB(MidB(Text,1+L+I,1))
			
			If I Mod 8 = 0 Then S = S & " "
			
			If B = 0 Then
				If Not Faint Then
					S = S & (CSI&"2m")
					Faint = True
				End If
			Else
				If Faint Then
					S = S & (CSI&"22m")
					Faint = False
				End If
			End If
			
			S = S & (Right("00" & Hex(B), 2) & " ")
		Next
		If Faint Then
			S = S & (CSI&"22m")
		End If
		
		' Pad bytes values
		While I < 16
			If I Mod 8 = 0 Then S = S & " "
			
			S = S + "   "
			I = I + 1
		WEnd
		
		' Prepare chars representation
		S = S & (" " & CSI&"33m" & ChrW(&h2502) & CSI&"m")
		Faint = False
		For I = 0 To 15
			If L+I >= LB Then Exit For
			B = AscB(MidB(Text,1+L+I,1))
			
			If B = 0 Then
				If Not Faint Then
					S = S & (CSI&"2m")
					Faint = True
				End If
			Else
				If Faint Then
					S = S & (CSI&"22m")
					Faint = False
				End If
			End If
			
			S = S & CP437wC0(B)
		Next
		If Faint Then
			S = S & (CSI&"22m")
		End If
		S = S & (CSI&"33m" & ChrW(&h2502) & CSI&"m")
		
		AXSH.Echo S
	Next
	
	' Show terminating null
	AXSH.Echo CSI&"36mSuffix  "&CSI&"96m  00 00" & CSI&"36m        (Terminating null character)         " & CSI&"96m" & ChrW(&h2502) & CSI&"36m" & ChrW(&h2400) & ChrW(&h2400) & CSI&"96m" & ChrW(&h2502) & CSI&"m"
	
	' Explain memory size
	AXSH.Echo vbCrLf & "Total string memory size is " & CSI&"95m4"&CSI&"m + " & LB & CSI&"m + " & CSI&"96m2"&CSI&"m = " & (4+LB+2) & " bytes"

	' Convert control characters embedded in a string into their printable picture representations
	For I = 0 To 31
		Text = Replace(Text, Chr(I), ChrW(&h2400+I))
	Next
	Text = Replace(Text, Chr(127), ChrW(&h2421))
	
	' Show the string
	AXSH.Echo vbCrLf & """" & Text &""""
End Sub
