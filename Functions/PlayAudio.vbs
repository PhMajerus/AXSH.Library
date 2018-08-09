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
' The Windows Media Player component is automatically released when file is
' finished playing.
'

Option Explicit

' We need the WMP object to survive to play audio in the background
Dim PlayAudio_WMP
Set PlayAudio_WMP = Nothing

Sub PlayAudio_HandlePlayStateChange (NewPlayState)
	If NewPlayState = 8 Then ' MediaEnded
		' Remove reference to WMPlayer object, which gets it destroyed
		' and the events detached automatically when object dissapears.
		Set PlayAudio_WMP = Nothing
	End If
End Sub

Sub PlayAudio (URL)
	If IsEmpty(URL) Or IsNull(URL) Or URL="" Then
		PlayAudio_WMP.Close
		Set PlayAudio_WMP = Nothing
	Else
		If PlayAudio_WMP Is Nothing Then
			Set PlayAudio_WMP = CreateObject("WMPlayer.OCX.7")
			PlayAudio_WMP.Settings.AutoStart = True
			AXSH.AttachEvent PlayAudio_WMP, "PlayStateChange", GetRef("PlayAudio_HandlePlayStateChange")
			' No need to DetachEvent explicitely, it gets cleaned up automatically when PlayAudio_WMP object is destroyed.
		End If
		PlayAudio_WMP.URL = URL
	End If
End Sub
