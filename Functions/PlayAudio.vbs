'
' Plays a single audio file
' 
' Uses Windows Media Player as an in-process automation object to play
' audio in the background, without any user interface.
' 
' File plays in the background until finished, or until function is called
' again.
' Calling the function with Empty or Null as argument interrupts the current
' playback and frees resources used by WMP.
' Calling the function again before the file is finished playing interrupts
' the current playback immediately and starts playing the new one.
'

Option Explicit

' We need the WMP object to survive to play audio in the background
Dim PlayAudio_WMP
Set PlayAudio_WMP = Nothing

Sub PlayAudio (URL)
	If IsEmpty(URL) Or IsNull(URL) Then
		Set PlayAudio_WMP = Nothing
	Else
		If PlayAudio_WMP Is Nothing Then
			Set PlayAudio_WMP = CreateObject("WMPlayer.OCX.7")
			PlayAudio_WMP.Settings.AutoStart = True
		End If
		PlayAudio_WMP.URL = URL
	End If
End Sub
