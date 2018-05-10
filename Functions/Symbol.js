/* 
** Symbol-like unique identifiers for JScript.
** 
** JScript does not support ES2015 symbols.
** In IDispatch(Ex) languages, all object properties, including for the
** global object, are identified by strings.
** This script provides a Symbol function that returns a GUID string object
** instead of a symbol, providing unique properties identifiers for JScript.
** 
** Note the returned symbol is an object, not a string primitive, it is a way
** to differentiate it from a literal symbol and allow extra information to
** be included, such as the optional description.
** It also provides the common Symbol.iterator placeholder "@@iterator"
** instead of a random GUID, making it compatible with code that explicitely
** use the placeholder string.
** 
** Side effects: properties added to an object using a GUID are enumerated,
** unlike real ES2016 symbols which are non-enumerable object property keys.
*/ 

// Symbol factory function
function Symbol(/*description*/) {
	if (this.constructor == Symbol) {
		var e = new TypeError("Symbol is not a constructor");
		e.description = e.message;
		throw e;
	}
	
	// Return a string object containing a random GUID
	var oleaut = new ActiveXObject("Majerus.Automation");
	var symbol = new String("@@" + oleaut.createGuid());
	if (arguments.length > 0)
		symbol.description = arguments[0];
	return symbol;
}

// Global symbol registry and factory
// Note that "for" is a reserved keyword in JScript, so the bracket notation
// is required, including when calling the method.
(function(){
	var registry = {};
	
	Symbol["for"] = function /*for*/ (key) {
		if (this.constructor == Symbol["for"]) {
			var e = new TypeError("Symbol.for is not a constructor");
			e.description = e.message;
			throw e;
		}
		if (key === undefined) {
			var e = new TypeError("Key is required for global symbols");
			e.description = e.message;
			throw e;
		}
		
		if (registry[key] !== undefined) {
			return registry[key];
		} else {
			var symbol = Symbol(key);
			registry[key] = symbol;
			return symbol;
		}
	};
	
	Symbol.keyFor = function /*keyFor*/ (sym) {
		var key = sym.description;
		if (registry[key] !== undefined)
			return key;
		else
			return undefined;
	};
})();

// Iteration symbol, using placeholder instead of random GUID.
Symbol.iterator = new String("@@iterator");
