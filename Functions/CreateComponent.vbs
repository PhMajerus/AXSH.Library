'
' Helper function to create unregistered Windows Script Components.
' 
' Any .wsc component placed in
' "%UserProfile%\Documents\Majerus.net ActiveScript Shell\Components\".
' can be instantiated without it being registered in the COM repository
' on the local system.
' 
' Note the strFileName is the file name of the component file without its
' ".wsc" extension, it does not necessarily match the ProgID (class name)
' of the component.
'

Option Explicit

Function CreateComponent(strFileName)
	' Use the Windows Script Component moniker to instantiate component from file path.
	Set CreateComponent = GetObject("script:" & AXSH.EnvVars.Expand("%UserProfile%\Documents\Majerus.net ActiveScript Shell\Components\") & strFileName & ".wsc")
End Function
