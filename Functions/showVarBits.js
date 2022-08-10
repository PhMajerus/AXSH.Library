

function showVarBits (variable) {
	if (arguments.length < 1)
		throw new Error("variable argument must be provided");
	
	
	function oleDateToDouble(date) {
		// OLE Automation Date use Variant internal floating-point format.
		// As JScript does not have immediate access to that format,
		// some processing is required, but the result is the native
		// format used inside Variants.
		var epoch = new Date(Date.UTC(1899,11,30));
		var tzOffset = new Date().getTimezoneOffset();
		return ((new Date(date).getTime() - epoch.getTime())/(1000*60) - tzOffset) / (60*24);
	}
	
	if (variable === undefined) {
		AXSH.echo("Variant is empty");
	} else if (variable === null) {
		AXSH.echo("Variant is Null");
	} else {
		switch (typeof variable) {
			
			case "string":
				showStringBits(variable);
				break;
			
			case "number":
				showNumberBits(variable);
				break;
			
			case "date":
				// OLE Dates are Doubles internally
				var dbl = oleDateToDouble(variable);
				showNumberBits(dbl);
				var jsd = new Date(variable);
				AXSH.echo(new Date(1899,11,30).toDateString() +" (OLE Epoch) + "+ dbl +" days = "+ jsd.toDateString() +" "+ jsd.toLocaleTimeString());
				break;
			
			default:
				throw new Error("Variant is an unsupported type");
		}
	}
}
