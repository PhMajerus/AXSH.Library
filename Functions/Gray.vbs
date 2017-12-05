'
' OLE Automation helper to convert lightness value to
' the corresponding OLE Color.
'

Option Explicit

' Convert from lightness value to an OLE Color.
Function Gray (Lightness)
	If Lightness < 0 Or Lightness > 1 Then
		Err.Raise 5, "Gray argument error", "Lightness parameter out of range: 0 "&ChrW(&h2264)&" Lightness "&ChrW(&h2264)&" 1"
	End If
	
	Dim L
	L = Round(Lightness*255)
	Gray = RGB(L, L, L)
End Function
