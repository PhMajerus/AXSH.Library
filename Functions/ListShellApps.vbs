'
' This procedure lists all available apps with their corresponding "shell:"
' commands.
' These can be used to launch any app from ActiveScript Shell using the Start
' function, or from the Explorer's Run dialog or CMD's Start command.
'

Option Explicit

Sub ListShellApps (NameSpecs)
	Dim reNameSpecs
	Set reNameSpecs = WildcardsToRegExp(NameSpecs)
	
	Dim ShellApp, FldrApps, Apps, Item, URI
	Set ShellApp = CreateObject("Shell.Application")
	Set FldrApps = ShellApp.Namespace("shell:::{4234d49b-0245-4df3-b780-3893943456e1}") ' AppsFolder
	Set Apps = FldrApps.Items
	For Each Item In Apps
		If reNameSpecs.Test(Item.Name) Then
			URI = "shell:AppsFolder\"& Item.Path
			AXSH.Echo Chr(27)&"[93m"& Item.Name &Chr(27)&"[90m  " & Chr(27)&"]8;;"&URI&Chr(7) & URI & Chr(27)&"]8;;"&Chr(7)
		End If
	Next
End Sub
