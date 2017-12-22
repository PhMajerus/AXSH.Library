' 
' Expose the JScript Math object for use in VBScript.
' 
' ActiveScript Shell includes a VBScript Math module which implements the
' ECMAScript Math object in VBScript code, and that is the recommended one
' to use from VBScript.  However if you need native performances, this one
' will run the JScript engine's native code implementation.
' Note however JScript "classic" lacks new Math features added in ES6 and
' later.  Also, JScript doesn't show its built-in members in "Help JSMath".
' 
' - Philippe Majerus, December 2017.
' 

Option Explicit

Dim JSMath, JSMath_SC

' This is quite a trick, we host a JScript engine and retrieve an interface
' to its Math object.  Since it is a standard COM automation implementation
' of the ECMAScript Math object, it gives us a native implementation of the
' standard Math object that can be used from VBScript as it.

' Create a Script Control object to host a JScript engine
On Error Resume Next
Set JSMath_SC = CreateObject("ScriptControl")
If Err.Number = 429 Then ' can't create object
	Err.Clear
	On Error GoTo 0
	' ScriptControl is only available on x86, try creating it
	' inside a WOW64 surrogate in case we're running on x64.
	Dim WOW64Hst
	Set WOW64Hst = CreateObject("axsh.x86Host")
	Set JSMath_SC = WOW64Hst.CreateObject("ScriptControl")
End If
On Error GoTo 0

' Configure the script engine
JSMath_SC.Language = "JScript.Compact" ' Prevent eval() by using ES-CP version.
JSMath_SC.UseSafeSubset = True ' Better safe than sorry, safe subset is enough.

' Extend JScript Math object to provide a VBScript-friendly default value.
JSMath_SC.ExecuteStatement("Math.valueOf = function () { return ""JScript native Math object""; };")

' Retrieve interface to Math object.
Set JSMath = JSMath_SC.Eval("Math;")

' We need to keep JSMath_SC around, or the JScript engine gets tore down,
' and the Math object starts acting erratically without its engine.
' It probably shares some state with the engine itself but doesn't hold a
' counted ref to it.  Do not set JSMath_SC to Nothing to cleanup!
' Unfortunately, this also means the JScript engine stays around even if you
' reassign the JSMath variable.
