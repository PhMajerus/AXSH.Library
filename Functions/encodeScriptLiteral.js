/*
** Encodes script source code so it cannot be easily viewed or modified by users.
** The JScript.Encode engine is requires to understand the encoded script.
** axsh /e:JScript.Encode
** 
** Note the encoding for JScript and VBScript is trivial and easily broken, this can
** at best be used to obfuscate a script to prevent casual viewing or file indexing.
*/

function encodeScriptLiteral (script) {
	var enc = new ActiveXObject("Scripting.Encoder");
	return enc.encodeScriptFile(".js", script, 0, "");
}
