'
' A powerline-style prompt.
' 
' Requires a font that contains powerline glyphs, such as "Cascadia Mono PL".
' 
' Use by assigning to the Prompt variable as follows:
'   Dim Prompt: Call PowerlinePrompt: Set Prompt = GetRef("PowerlinePrompt")
' or by declaring a Prompt function using it as follows:
'   Function Prompt: Prompt = PowerlinePrompt: End Function
'

Option Explicit

' This is a recursive function to build an array without resizing it.
' It walks down the parents, sizes the array once, then fills it when returning back up.
Function PowerlinePrompt_BuildPathArray (ByRef aPath, Item, Depth)
	' Test Item.Parent instead of just Item to exclude root container from array.
	If Item.Parent Is Nothing Then
		' Reached root container, size array accordingly.
		ReDim aPath(Depth-1)
	Else
		PowerlinePrompt_BuildPathArray aPath, Item.Parent, Depth+1
		' Populate array on the way back up.
		aPath(UBound(aPath)-Depth) = Item.Name
	End If
End Function

Function PowerlinePrompt
	Dim aPath, URL, L1, L2
	
	' Prepare line 2 ("VBS>")
	If AXSH.Configuration.IsElevated Then
		L2 = Chr(27)&"[46;30mVBS"&Chr(27)&"[41;36m"&ChrW(&hE0B0)&Chr(27)&"[97m Admin "&Chr(27)&"[49;31m"&ChrW(&hE0B0)&Chr(27)&"[m "
	Else
		L2 = Chr(27)&"[46;30mVBS"&Chr(27)&"[49;36m"&ChrW(&hE0B0)&Chr(27)&"[m "
	End If
	
	' Handle special case when location isn't set
	If Not IsObject(AXSH.Location) Then
		PowerlinePrompt = vbCrLf & L2
		Exit Function
	End If
	
	' Build a path array from the current location
	PowerlinePrompt_BuildPathArray aPath, AXSH.Location, 0
	
	' Get hyperlink URL if available
	On Error Resume Next
	URL = AXSH.Location.URL
	If Err.Number <> 0 Then URL = vbNullString
	On Error GoTo 0 ' also clears Err
	
	' Prepare line 1
	If UBound(aPath) >= 0 Then
		L1 = Chr(27)&"[46;97m " & Arrays.Shift(aPath)
		If UBound(aPath) >= 0 Then
			L1 = L1 & " " & Chr(27)&"[36;100m" & ChrW(&hE0B4) & Chr(27)&"[37m " & Join(aPath, " " & ChrW(&hE0B5) & " ") & " " & Chr(27)&"[49;90m" & ChrW(&hE0B4) & Chr(27)&"[m"
		Else
			On Error Resume Next ' skip if container has no DisplayName property
			L1 = L1 & " " & Chr(27)&"[96m" & ChrW(&hE0B5) & " " & Chr(27)&"[90m" & AXSH.Location.DisplayName & " " & Chr(27)&"[36;49m" & ChrW(&hE0B4) & Chr(27)&"[m"
			If Err.Number <> 0 Then
				L1 = L1 & " " & Chr(27)&"[36;49m" & ChrW(&hE0B4) & Chr(27)&"[m"
			End If
			On Error GoTo 0 ' also clears Err
		End If
	Else
		L1 = Chr(27)&"[44;97m " & AXSH.Location.Path & " " & Chr(27)&"[94m" & ChrW(&hE0B5) & " " & Chr(27)&"[37m" & AXSH.Location.Provider & " " & Chr(27)&"[34;49m" & ChrW(&hE0B4) & Chr(27)&"[m"
	End If
	If URL <> "" Then
		' Enclose path in hyperlink
		L1 = (Chr(27)&"]8;;" & URL & Chr(7)) & L1 & (Chr(27)&"]8;;"&Chr(7))
	End If
	
	' Return complete prompt string
	PowerlinePrompt = vbCrLf & L1 & vbCrLf & L2
End Function
