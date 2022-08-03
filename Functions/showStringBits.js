/*
** JavaScript strings are stored internally in UTF-16.
** This function shows in the console the hexadecimal representation of a
** string.
** It is designed as a learning and debugging tool to get a better
** understanding of strings' representations in memory.
** 
** Philippe Majerus, February 2020, updated August 2022.
*/


function showStringBits (text) {
	text = String(text);
	
	// Convert control characters embedded in a string into their printable picture representations.
	function stringControlCodesToPictures(str) {
		// Convert C0 and DEL control codes to control pictures, leave SP (space) as it.
		return str.replace(/([\u0000-\u001F])/g, function(character){ return String.fromCharCode(0x2400+character.charCodeAt(0)); }).replace(/(\u007F)/g, '\u2421');
	}
	
	// Create a stream to contain the string
	var stream = new ActiveXObject("ADODB.Stream");
	stream.open();
	stream.type = 1 /*adTypeBinary*/;
	
	// ADODB.Stream with UTF-16 encoding includes a BOM.
	// Create another stream to encode the string...
	var binstream = new ActiveXObject("ADODB.Stream");
	binstream.open();
	binstream.type = 2 /*adTypeText*/;
	binstream.charset = "utf-16";
	binstream.writeText(text);
	// ... and copy characters to main stream without the BOM.
	binstream.position = 2; // skip BOM
	binstream.copyTo(stream);
	binstream.close();
	
	// Show stream using hexdump.
	AXSH.echo("          \x1B[90mstring bytes\x1B[2m (UTF-16)\x1B[m");
	hexdump(stream);
	
	stream.close();
	
	// Explain memory size
	AXSH.echo("\r\nActive Scripting, and by extension JScript, stores strings in memory using BSTRs")
	AXSH.echo("Total string memory size is 4 + " + (text.length*2) + " + 2 = " + (text.length*2+6) + " bytes");
	
	// Show the string
	AXSH.echo("\r\n\""+stringControlCodesToPictures(text)+"\"");
}
