'
' OLE Automation helper to convert hue, saturation,
' lightness values to the corresponding OLE Color.
' Unlike the common hsl(h,s,l) function, this one
' provides more balanced sin-based colors.
' Arguments are identical to hsl and it can be
' used as an in-place replacement.
' 
' - Philippe Majerus, December 2017.
'

Option Explicit

' Convert from hue,satur.,light. values to an OLE Color.
Function Sinebow (Hue, Saturation, Lightness)
	If Saturation < 0 Or Saturation > 1 Then
		Err.Raise 5, "Sinebow argument error", "Saturation parameter out of range: 0 "&ChrW(&h2264)&" Saturation "&ChrW(&h2264)&" 1"
	End If
	If Lightness < 0 Or Lightness > 1 Then
		Err.Raise 5, "Sinebow argument error", "Lightness parameter out of range: 0 "&ChrW(&h2264)&" Lightness "&ChrW(&h2264)&" 1"
	End If
	
	Dim Chroma, Offset, Angle, Red, Green, Blue
	Const Circle = 6.283185307179586
	Chroma = (1 - Abs(2*Lightness - 1)) * Saturation / 2
	Offset = Circle/3
	Angle = Circle/4 - Hue*Circle/360
	Red = Sin(Angle) * Chroma + Lightness
	Green = Sin(Angle+Offset) * Chroma + Lightness
	Blue = Sin(Angle+Offset*2) * Chroma + Lightness
	
	Sinebow = (Round(Blue*255)*256 + Round(Green*255))*256 + Round(Red*255)
End Function
