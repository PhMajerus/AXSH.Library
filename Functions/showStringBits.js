/*
** JavaScript strings are stored internally in UTF-16.
** In Active Scripting, strings are stored as BSTRs, and script engines often
** use the same format to avoid conversions.
** This procedure shows in the console the hexadecimal representation of a
** string along with a CP 437 representation of its bytes, similarly to the
** hexdump procedure. It also includes BSTR-specific prefix and suffix.
** It is designed as a learning and debugging tool to get a better
** understanding of strings' representations in memory.
** 
** Note this procedure does not handle the special case of COM Null String,
** which instead of using 6 bytes (4 length + 0 payload + 2 terminating
** null), uses 0 bytes. By convention, a null BSTR is equal to a empty string
** BSTR, but without using any memory for the string storage.
** It also cannot properly display BSTR strings with an odd number of bytes,
** but those are not considered valid JavaScript strings (VB Byte Strings).
** 
** Philippe Majerus, February 2020, rewritten August 2022.
*/


var showStringBits = (function(){
	
	// Mapping table for Codepage 437 with control characters as glyphs
	var cp437wC0 = [
	'\u2400','\u2401','\u2402','\u2403','\u2404','\u2405','\u2406','\u2407','\u2408','\u2409','\u240A','\u240B','\u240C','\u240D','\u240E','\u240F',
	'\u2410','\u2411','\u2412','\u2413','\u2414','\u2415','\u2416','\u2417','\u2418','\u2419','\u241A','\u241B','\u241C','\u241D','\u241E','\u241F',
	'\u0020','\u0021','\u0022','\u0023','\u0024','\u0025','\u0026','\u0027','\u0028','\u0029','\u002A','\u002B','\u002C','\u002D','\u002E','\u002F',
	'\u0030','\u0031','\u0032','\u0033','\u0034','\u0035','\u0036','\u0037','\u0038','\u0039','\u003A','\u003B','\u003C','\u003D','\u003E','\u003F',
	'\u0040','\u0041','\u0042','\u0043','\u0044','\u0045','\u0046','\u0047','\u0048','\u0049','\u004A','\u004B','\u004C','\u004D','\u004E','\u004F',
	'\u0050','\u0051','\u0052','\u0053','\u0054','\u0055','\u0056','\u0057','\u0058','\u0059','\u005A','\u005B','\u005C','\u005D','\u005E','\u005F',
	'\u0060','\u0061','\u0062','\u0063','\u0064','\u0065','\u0066','\u0067','\u0068','\u0069','\u006A','\u006B','\u006C','\u006D','\u006E','\u006F',
	'\u0070','\u0071','\u0072','\u0073','\u0074','\u0075','\u0076','\u0077','\u0078','\u0079','\u007A','\u007B','\u007C','\u007D','\u007E','\u2421',
	'\u00C7','\u00FC','\u00E9','\u00E2','\u00E4','\u00E0','\u00E5','\u00E7','\u00EA','\u00EB','\u00E8','\u00EF','\u00EE','\u00EC','\u00C4','\u00C5',
	'\u00C9','\u00E6','\u00C6','\u00F4','\u00F6','\u00F2','\u00FB','\u00F9','\u00FF','\u00D6','\u00DC','\u00A2','\u00A3','\u00A5','\u20A7','\u0192',
	'\u00E1','\u00ED','\u00F3','\u00FA','\u00F1','\u00D1','\u00AA','\u00BA','\u00BF','\u2310','\u00AC','\u00BD','\u00BC','\u00A1','\u00AB','\u00BB',
	'\u2591','\u2592','\u2593','\u2502','\u2524','\u2561','\u2562','\u2556','\u2555','\u2563','\u2551','\u2557','\u255D','\u255C','\u255B','\u2510',
	'\u2514','\u2534','\u252C','\u251C','\u2500','\u253C','\u255E','\u255F','\u255A','\u2554','\u2569','\u2566','\u2560','\u2550','\u256C','\u2567',
	'\u2568','\u2564','\u2565','\u2559','\u2558','\u2552','\u2553','\u256B','\u256A','\u2518','\u250C','\u2588','\u2584','\u258C','\u2590','\u2580',
	'\u03B1','\u00DF','\u0393','\u03C0','\u03A3','\u03C3','\u00B5','\u03C4','\u03A6','\u0398','\u03A9','\u03B4','\u221E','\u03C6','\u03B5','\u2229',
	'\u2261','\u00B1','\u2265','\u2264','\u2320','\u2321','\u00F7','\u2248','\u00B0','\u2219','\u00B7','\u221A','\u207F','\u00B2','\u25A0','\u2420'
	];
	
	// Convert control characters embedded in a string into their printable picture representations.
	function stringControlCodesToPictures(str) {
		// Convert C0 and DEL control codes to control pictures, leave SP (space) as it.
		return str.replace(/([\u0000-\u001F])/g, function(character){ return String.fromCharCode(0x2400+character.charCodeAt(0)); }).replace(/(\u007F)/g, '\u2421');
	}
	
	return function /*showStringBits*/ (text) {
		var str = String(text);
		var len = str.length;
		var l, c, t;
		
		AXSH.echo("          \x1B[90mstring bytes\x1B[2m (UTF-16)\x1B[m");
		AXSH.echo("          \x1B[90m+0 +1 +2 +3 +4 +5 +6 +7  +8 +9 +A +B +C +D +E +F   0123456789ABCDEF\x1B[m");
		
		// Show length prefix bytes (BSTR-specific)
		t = ("00000000" + (len*2).toString(16).toUpperCase()).slice(-8);
		// Format them in little-endian order
		t = t.substring(6,8) + " " + t.substring(4,6) + " " + t.substring(2,4) +" " + t.substring(0,2);
		AXSH.echo("\x1B[35mPrefix  \x1B[95m  " + t + "\x1B[35m  (String is " + (len*2) + " bytes long)\x1B[m");
		
		// Show chars bytes
		for (l = 0; l < len; l+=8) {
			t = "";
			var faint = false;
			
			// Line offset
			var s = "\x1B[90m" + ("00000000"+(l*2).toString(16).toUpperCase()).slice(-8) +"\x1B[m ";
			
			// Hexadecimal values (and preparing text substring)
			for (c = 0; (c < 8) && (c+l < len); c++)
			{
				var cc = str.charCodeAt(c+l);
				
				// Handle low byte of char
				var b = cc & 0xFF;
				
				if (c%4===0) s+=" ";
				
				// Show 00 bytes as faint
				if (b === 0) {
					if (!faint) {
						s += "\x1B[2m";
						t += "\x1B[2m";
						faint = true;
					}
				} else {
					if (faint) {
						s += "\x1B[22m";
						t += "\x1B[22m";
						faint = false;
					}
				}
				
				s += ("00"+ b.toString(16).toUpperCase()).slice(-2) +" ";
				t += cp437wC0[b];
				
				// Handle high byte of char
				b = cc >> 8;
				
				// Show 00 bytes as faint
				if (b === 0) {
					if (!faint) {
						s += "\x1B[2m";
						t += "\x1B[2m";
						faint = true;
					}
				} else {
					if (faint) {
						s += "\x1B[22m";
						t += "\x1B[22m";
						faint = false;
					}
				}
				
				s += ("00"+ b.toString(16).toUpperCase()).slice(-2) +" ";
				t += cp437wC0[b];
			}
			
			if (faint) {
				s += "\x1B[22m";
				t += "\x1B[22m";
			}
			
			// Hexadecimal padding
			for (;c < 8; c++)
			{
				if (c%4===0) s+=" ";
				s += "      ";
			}
			
			// Append text substring
			s += " \x1B[33m\u2502\x1B[m"+ t +"\x1B[33m\u2502\x1B[m";
			
			AXSH.echo(s);
		}
		
		// Show terminating null
		AXSH.echo("\x1B[36mSuffix  \x1B[96m  00 00\x1B[36m        (Terminating null character)         \x1B[96m\u2502\x1B[36m\u2400\u2400\x1B[96m\u2502\x1B[m");
		
		// Explain memory size
		AXSH.echo("\r\nActive Scripting, and by extension JScript, stores strings in memory using BSTRs")
		AXSH.echo("Total string memory size is \x1B[95m4\x1B[m + " + (len*2) + " + \x1B[96m2\x1B[m = " + (len*2+6) + " bytes");
		
		// Show the string
		AXSH.echo("\r\n\x1B[90m\"\x1B[m"+stringControlCodesToPictures(str)+"\x1B[90m\"\x1B[m");
	};
	
})();
