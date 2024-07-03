/*
** Converts a binary buffer to a Free Speech flag.
** 
** Uses the bytes as R,G,B values for each band of the flag, similarly to the
** original Free Speech flag by John Marcotte.
** If the bytes sequence is not a multiple of 3, the remaining bytes can
** either be converted to a color by completing the RGB value with a
** specified padding byte value, or appended as hexadecimal values displayed
** after the flag.
** 
** Example usage:
** var b = Encodings.base85ToBinary("$2G/7STNmrfKiQW@oeE$");
** echo(binaryToFreeSpeechFlag(b));
** var b = Encodings.base85ToBinary("7bm:X(]HkU#p\\c&jHX6eeBP;9");
** echo(binaryToFreeSpeechFlag(b));
*/


function binaryToFreeSpeechFlag(bin /*, paddingValue*/) {
	var JSX = new ActiveXObject("Majerus.JSX");
	var a = new JSX.Uint8Array(bin);
	var l = a.length;
	var c = l/3;
	var paddingValue = arguments[1];
	if (arguments.length > 1) {
		c = Math.ceil(c);
	} else {
		c = Math.floor(c);
	}
	
	var sb = new Array();
	for (var i = 0; i < c; i++) {
		var r = a[i*3+0] || paddingValue;
		var g = a[i*3+1] || paddingValue;
		var b = a[i*3+2] || paddingValue;
		
		sb.push("\x1B[38;2;"+r.toString(10)+";"+g.toString(10)+";"+b.toString(10)+"m\u2588");
	}
	sb.push("\x1B[39m");
	
	if (arguments.length <= 1) {
		sb.push("\xA0+");
		for (var i = c*3; i < l; i++) {
			sb.push(a[i].toString(16).toUpperCase());
		}
	}
	
	return sb.join("");
}
