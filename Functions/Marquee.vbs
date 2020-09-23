'
' Converts a single line of text into an animated marquee string.
' 
' This function returns a string with ActiveScript Shell-specific control
' characters to handle animation. When output using AXSH.Echo, it will show
' the text scrolling like a marquee.
' 
' Sample usage:
' Echo Marquee("*** This is a simple marquee test! ***", 10, "-=]", "[=-")
'

Option Explicit

Function Marquee (Text, Width, Prefix, Suffix)
	Dim Nbsp, Delay, LenText, Back, Offset, OffsetText, LenLead, LenTrail
	
	With New RegExp
		.Pattern = "[\x00-\x1F\x7F]"
		If .Test(Text) Then
			Err.Raise 5, , "Marquee Text cannot contain control characters"
		End If
		If .Test(Prefix) Then
			Err.Raise 5, , "Marquee Prefix cannot contain control characters"
		End If
		If .Test(Suffix) Then
			Err.Raise 5, , "Marquee Suffix cannot contain control characters"
		End If
	End With
	If Not IsNumeric(Width) Or (Width < 0) Then
		Err.Raise 5, , "Marquee Width must be a positive number"
	End If
	
	Marquee = vbNullString
	Nbsp = ChrW(&hA0)
	Delay = Chr(&h1E) ' RS (100ms delay)
	
	' Hide cursor
	Marquee = Marquee & Chr(27)&"[?25l"
	
	' Add prefix
	Marquee = Marquee & Prefix
	
	' Animate marquee
	LenText = Len(Text)
	Back = String(Width + Len(Suffix), vbBack)
	For Offset = -Width To LenText
		' Add marquee frame
		If Offset < 0 Then
			OffsetText = 0
			LenLead = -Offset
		Else
			OffsetText = Offset
			LenLead = 0
		End If
		If (LenText-Offset) < Width Then
			LenTrail = Width-(LenText-Offset)
		Else
			LenTrail = 0
		End If
		Marquee = Marquee & String(LenLead, Nbsp) & Mid(Text, OffsetText+1, Width-LenLead) & String(LenTrail, Nbsp)
		
		' Add suffix
		Marquee = Marquee & Suffix
		
		' Insert pause in output. This is ActiveScript Shell-specific.
		Marquee = Marquee & Delay
		
		' Go back to beginning of marquee
		If Offset < LenText Then ' Don't after last frame
			Marquee = Marquee & Back
		End If
	Next
	
	' Show cursor
	Marquee = Marquee & Chr(27)&"[?25h"
End Function
