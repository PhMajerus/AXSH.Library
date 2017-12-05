' OLE Automation helper to convert hue, saturation,
' lightness values to the corresponding OLE Color.

Option Explicit

' Convert from hue,satur.,light. values to an OLE Color.
Function HSL (Hue, Saturation, Lightness)
	If Saturation < 0 Or Saturation > 1 Then
		Err.Raise 5, "HSL argument error", "Saturation parameter out of range: 0 "&ChrW(&h2264)&" Saturation "&ChrW(&h2264)&" 1"
	End If
	If Lightness < 0 Or Lightness > 1 Then
		Err.Raise 5, "HSL argument error", "Lightness parameter out of range: 0 "&ChrW(&h2264)&" Lightness "&ChrW(&h2264)&" 1"
	End If
	
	Dim Chroma, H, X, Red, Green, Blue, M
	Chroma = (1 - Abs(2*Lightness - 1)) * Saturation
	H = (Hue-(Int(Hue/360)*360)) / 60
	X = Chroma * (1 - Abs((H-(Int(H/2)*2)) - 1))
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
	
	HSL = RGB(Round((Red+M)*255), Round((Green+M)*255), Round((Blue+M)*255))
End Function
