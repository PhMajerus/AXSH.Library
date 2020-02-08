'
' Encodes script source code so it cannot be easily viewed or modified by users.
' The VBScript.Encode engine is requires to understand the encoded script:
' axsh /e:VBScript.Encode
' 
' Note the encoding for JScript and VBScript is trivial and easily broken, this can
' at best be used to obfuscate a script.
'

Option Explicit

Function EncodeScriptLiteral (Script)
	Dim Enc
	Set Enc = CreateObject("Scripting.Encoder")
	EncodeScriptLiteral = Enc.EncodeScriptFile(".vbs", Script, 0, vbNullString)
End Function
