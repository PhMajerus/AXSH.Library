/* 
** Symbol-like unique identifiers for JScript.
** 
** JScript does not support ES2015 symbols.
** In IDispatch(Ex) languages, all object properties, including for the
** global object, are identified by strings.
** This script provides a Symbol function that returns a GUID string
** instead of a symbol, providing unique properties identifiers for JScript.
** 
** It also provides the common Symbol.iterator placeholder "@@iterator"
** instead of a random GUID, making it compatible with code that explicitely
** use the placeholder string.
** 
** Side effects: properties added to an object using a GUID are enumerated,
** unlike real ES2016 symbols which are non-enumerable object property keys.
*/ 

// Symbol factory function
function Symbol(/*desc*/) {
	if (this.constructor == Symbol) {
		var e = new TypeError("Symbol is not a constructor");
		e.description = e.message;
		throw e;
	}
	
	// Return a string containing a random GUID, desc argument is ignored.
	var oleaut = new ActiveXObject("Majerus.Automation");
	return "_" + oleaut.createGuid();
}

// Iteration symbol, using placeholder instead of random GUID.
Symbol.iterator = "@@iterator";
