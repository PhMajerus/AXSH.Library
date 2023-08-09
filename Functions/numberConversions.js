/*
** Compare all floating-point formats
** 
** Unfortunately, JScript doesn't let Decimal getting passed between methods
** calls, it automatically gets converted to Number (Double), losing
** precision.
** Only using another language can properly show the Decimal version.
** 
** Example usage:
** numberConversions("+3141592653589793238462643383279503E-33");
*/


function numberConversions (val) {
	var enc = new ActiveXObject("AXSH.Encodings");
	var binCv = new ActiveXObject("Majerus.BinaryConverter");
	var sl = new ActiveXObject("Majerus.Automation.Single");
	var dl = new ActiveXObject("Majerus.Automation.Double");
	var dec = new ActiveXObject("Majerus.Automation.Decimal");
	var cy = new ActiveXObject("Majerus.Automation.Currency");
	var al = "0123456789ABCDEF ";
	var t;
	
	// Helper to convert a number string that uses a fixed or exponent-based format into its normalized form.
	function normalizeNumberString(str) {
		//         ([1 s])([2i])(    [3 f] )(      [4  exp. ] )
		var re = /^([+-])?(\d+)?(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/;
		var m = str.match(re);
		
		if (m === null)
			return str;
		
		// Number, convert to scientific notation
		var man = m[2]+m[3]; // full mantissa as string
		var l = man.length; // number of digits
		var exp = 0;
		if (m[4]!=="")
			exp = parseInt(m[4]); // exponent as number
		
		// Adjust exp according to existing decimal point if present
		exp += (parseInt(m[2].length)-1);
		
		// Handle as a special case if decimal point is exactly
		// the first character, so adding a leading 0 can avoid
		// having to use a decimal exponent. This can be removed
		// if scientific notation is always preferred.
		if (exp === -1) {
			return (m[1]==="-" ? "-" : "") + "0." + man;
		}
		
		return (m[1]==="-" ? "-" : "") + man.substr(0,1) + (man.length>1?("."+man.substr(1)):"") + (exp!==0 ? ("e" + (exp>=0 ? "+" : "") + exp.toString()) : "");
	}
	
	// Get requested number as a string and as a double
	var sv = normalizeNumberString(String(val));
	var dv = Number(val);
	echo("String format: "+sv);
	
	// Prepare a regexp to parse a number string in scientific notation, with a mandatory exponent part.
	var reDbl = /^(\d(?:\.\d+)?)([eE][+-]?\d+)$/;
	
	
	function highlight(str) {
		//var dbl = Number(str);
		str = normalizeNumberString(String(str));
		
		var matchVal = reDbl.exec(str);
		var matchRef = reDbl.exec(sv);
		
		// Should we compare as scientific notations, or lexicographically?
		// If both values are parsed by the regexp and their exponents match, compare as scientific.
		if ((matchVal!==null) && (matchRef!==null) && (matchVal[2]===matchRef[2])) {
			var s1 = matchVal[1];
			var s2 = matchRef[1];
			var l = s1.length;
			for (var i=0; i<l; i++) {
				if (s1.charAt(i)!==s2.charAt(i)) {
					break;
				}
			}
			return "\x1B[92m"+s1.substr(0,i)+"\x1B[31m"+s1.substr(i)+"\x1B[92m"+matchVal[2]+"\x1B[m";
		} else {
			var l = str.length;
			for (var i=0; i<l; i++) {
				if (str.charAt(i)!==sv.charAt(i)) {
					break;
				}
			}
			return "\x1B[92m"+str.substr(0,i)+"\x1B[31m"+str.substr(i)+"\x1B[m";
		}
	}
	
	var ellipsis = " . . . . . . . . . . . . . . . . . . . . . . . ";
	function report(name, binary, val) {
		var sBin = enc.binaryToBase16(binary,al);
		var sDots = sBin.length >= 47 ? "" : ellipsis.slice(-(47-sBin.length));
		AXSH.echo(name + ("         ".substr(name.length,9)) + ": " + sBin  + "\x1B[90m " + sDots + "= " + highlight(val));
	}
	
	AXSH.echo("\r\n\x1B[4mNumber conversions\x1B[24m");
	binCv.byteOrder = 0 /*boBigEndian*/;
	AXSH.echo("\x1B[3;33mInteger formats\x1B[39;23m");
	try {
		t = binCv.fromByte(val);     report("Byte", t, binCv.toByte(t));
	} catch(ex) {
		AXSH.echo("Byte     : " + ex.description);
	}
	try {
		t = binCv.fromSByte(val);     report("Int8", t, binCv.toSByte(t));
	} catch(ex) {
		AXSH.echo("Int8     : " + ex.description);
	}
	try {
		t = binCv.fromInt16(val);     report("Int16/Int", t, binCv.toInt16(t));
	} catch(ex) {
		AXSH.echo("Int16/Int: " + ex.description);
	}
	try {
		t = binCv.fromInt32(val);     report("Int32/Lng", t, binCv.toInt32(t));
	} catch(ex) {
		AXSH.echo("Int32/Lng: " + ex.description);
	}
	AXSH.echo("\x1B[3;33mFloating-point & fixed-point formats\x1B[39;23m");
	t = binCv.fromSingle(val);   report("Single", t, binCv.toSingle(t));
	t = binCv.fromDouble(val);   report("Double", t, binCv.toDouble(t));
	try {
		t = binCv.fromCurrency(val); report("Currency", t, binCv.toCurrency(t));
	} catch(ex) {
		AXSH.echo("Currency : " + ex.description);
	}
	
	// Unfortunately, JScript will round the decimal to a double (Number) below.
	try {
		t = binCv.fromDecimal(val,true);
		AXSH.echo("Decimal  : " + enc.binaryToBase16(t,al) + "\x1B[90m 00 0E = " + highlight(dec.str(binCv.toDecimal(t,true))) + " (limited by JScript)");
	} catch(ex) {
		AXSH.echo("Decimal  : " + ex.description);
	}
	
	AXSH.echo("\x1B[3;33mMinifloats\x1B[2m (GPUs & NPUs/TPUs)\x1B[22;39;23m");
	t = binCv.fromHalf(val);     report("FP16/Half", t, binCv.toHalf(t));
	t = binCv.fromBfloat16(val); report("BFloat16", t, binCv.toBfloat16(t));
	t = binCv.fromFP8E4M3(val);  report("FP8 E4M3", t, binCv.toFP8E4M3(t));
	t = binCv.fromFP8E5M2(val);  report("FP8 E5M2", t, binCv.toFP8E5M2(t));
	
	AXSH.echo("\x1B[3;33mIEEE 754 decimal floating-point formats\x1B[m");
	var D32MP = new ActiveXObject("Majerus.Decimal32");
	t = D32MP.convert(val);
	report("d32 BID", D32MP.getBIDBinary(t,0), D32MP.str(t));
	report("d32 DPD", D32MP.getDPDBinary(t,0), D32MP.str(t));
	var D64MP = new ActiveXObject("Majerus.Decimal64");
	t = D64MP.convert(val);
	report("d64 BID", D64MP.getBIDBinary(t,0), D64MP.str(t));
	report("d64 DPD", D64MP.getDPDBinary(t,0), D64MP.str(t));
	var D128MP = new ActiveXObject("Majerus.Decimal128");
	t = D128MP.convert(val);
	report("d128 BID", D128MP.getBIDBinary(t,0), D128MP.str(t));
	report("d128 DPD", D128MP.getDPDBinary(t,0), D128MP.str(t));

	
	AXSH.echo("\x1B[3;33mLegacy Microsoft BASIC formats\x1B[2m (binary & decimal/BCD)\x1B[22;39;23m");
	try {
		t = binCv.fromMBF32(val);    report("MBF 32",   t, binCv.toMBF32(t));
	} catch(ex) {
		AXSH.echo("MBF 32   : " + ex.description);
	}
	try {
		t = binCv.fromMBF40(val);    report("MBF 40",   t, binCv.toMBF40(t));
	} catch(ex) {
		AXSH.echo("MBF 40   : " + ex.description);
	}
	try {
		t = binCv.fromMBF64(val);    report("MBF 64",   t, binCv.toMBF64(t));
	} catch(ex) {
		AXSH.echo("MBF 64   : " + ex.description);
	}
	try {
		t = binCv.fromMDF32(val);    report("MDF 32",   t, binCv.toMDF32(t));
	} catch(ex) {
		AXSH.echo("MDF 32   : " + ex.description);
	}
	try {
		t = binCv.fromMDF64(val);    report("MDF 64",   t, binCv.toMDF64(t));
	} catch(ex) {
		AXSH.echo("MDF 64   : " + ex.description);
	}
}
