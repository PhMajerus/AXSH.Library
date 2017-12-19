'
' OLE Automation helper to convert hue, saturation, lightness values to the
' corresponding OLE Color using the ANSI/VT 256 colors palette.
' This is used to compute colors for use with Majerus.ANSI RGB colors methods.
'

Option Explicit

' Convert from hue,satur.,light. values to a palette-indexed OLE Color.
Function HSL256 (Hue, Saturation, Lightness)
	If Saturation < 0 Or Saturation > 1 Then
		Err.Raise 5, "HSL256 argument error", "Saturation parameter out of range: 0 "&ChrW(&h2264)&" Saturation "&ChrW(&h2264)&" 1"
	End If
	If Lightness < 0 Or Lightness > 1 Then
		Err.Raise 5, "HSL256 argument error", "Lightness parameter out of range: 0 "&ChrW(&h2264)&" Lightness "&ChrW(&h2264)&" 1"
	End If
	
	Dim Chroma, H, X, Red, Green, Blue, M
	Chroma = (1 - Abs(2*Lightness - 1)) * Saturation
	H = (Hue-Fix(Hue/360)*360) / 60
	X = Chroma * (1 - Abs((H-Fix(H/2)*2) - 1))
	If H <= 1 Then
		Red = Chroma: Green = X: Blue = 0
	ElseIf H <= 2 Then
		Red = X: Green = Chroma: Blue = 0
	ElseIf H <= 3 Then
		Red = 0: Green = Chroma: Blue = X
	ElseIf H <= 4 Then
		Red = 0: Green = X: Blue = Chroma
	ElseIf H <= 5 Then
		Red = X: Green = 0: Blue = Chroma
	Else ' H <= 6 Then
		Red = Chroma: Green = 0: Blue = X
	End If
	M = Lightness - (Chroma / 2)
	
	HSL256 = CLng(&h01000000 + 16 + 36*Round((Red+M)*5) + 6*Round((Green+M)*5) + Round((Blue+M)*5))
End Function
