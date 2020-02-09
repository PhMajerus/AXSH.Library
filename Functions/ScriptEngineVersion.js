/*
** Returns the complete version string of JScript.
** 
** This requires conditional compilation, supported by JScript.
** If the script engine does not support conditional compilation, an error
** will be triggered.
** 
** It should typically return the same result as the following expression:
** (ScriptEngineMajorVersion()+"."+ScriptEngineMinorVersion()+"."+ScriptEngineBuildVersion())
*/

/*@cc_on @*/

function ScriptEngineVersion() {
	/*@
	return @_jscript_version.toString() +"."+ @_jscript_build.toString();
	@*/
	
	// Everything above is ignored if engine isn't JScript.
	throw new Error("Script engine does not support conditional compilation");
}
