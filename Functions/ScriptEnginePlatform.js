/*
** Returns the operating system architecture.
** 
** This requires conditional compilation, supported by JScript.
** If the platform isn't known, undefined is returned (function
** probably could be extended to tests its cc variable, but all
** currently supported platforms are listed here.
** If the script engine does not support conditional compilation,
** an error will be triggered.
** 
** Note if you're running 32-bit JScript on top of WoW64 on an Win64 system,
** you'll get "Win32". This is expected as you're effectively in Win32 mode.
** 
*/


/*@cc_on @*/

function ScriptEnginePlatform() {
	/*@if (@_win64)
		return "Win64"; // Windows 64-bit editions
	@elif (@_win32)
		return "Win32"; // Windows NT or 9X and later 32-bit editions
	@elif (@_win16)
		return "Win16"; // Windows 3.x
	@elif (@_mac)
		return "Macintosh" // Apple Macintosh system.
	@else
		return undefined; // Unknown architecture
	@end @*/
	
	// Everything above is ignored if engine isn't JScript.
	throw new Error("Script engine does not support conditional compilation");
}
