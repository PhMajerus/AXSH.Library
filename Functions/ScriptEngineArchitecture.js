/*
** Returns the processor architecture of the system.
** 
** This function isn't really needed in ActiveScript Shell, as the
** AXSH.version.architecture property can provide the same information
** without the need for conditional compilation. This function however
** has the benefit of being available in other JScript hosts such as WSH.
** 
** This requires conditional compilation, supported by JScript.
** If the processor isn't known, undefined is returned (function probably
** could be extended to tests its cc variable, but all currently supported
** processors are listed here, except new ARM and ARM64 builds.
** If the script engine does not support conditional compilation, an error
** will be triggered.
** 
** Note if you're running 32-bit JScript on top of WoW64 on an x64 processor,
** you'll get "x86". This is expected as you're effectively in x86 mode.
** 
*/

/*@cc_on @*/

function ScriptEngineArchitecture() {
	/*@if (@_amd64)
		return "x64"; // AMD x86-64 architecture
	@elif (@_x86)
		return "x86"; // Intel x86 architecture
	@elif (@_alpha)
		return "alpha"; // DEC Alpha processor
	@elif (@_mc680x0)
		return "680x0"; // Motorola 680x0 processor
	@elif (@_PowerPC)
		return "PowerPC"; // Motorola PowerPC processor
	@elif (@_ia64)
		return "IA-64"; // Intel Itanium architecture
	@elif (@_sparc)
		return "Sparc"; // Sun Sparc architecture
	@elif (@_hp)
		return "HP/PA"; // HP PA-RISC architecture
	@else
		return undefined; // Unknown architecture
	@end @*/
	
	// Everything above is ignored if engine isn't JScript.
	throw new Error("Script engine does not support conditional compilation");
}
