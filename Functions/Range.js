/*
** Creates iterable ranges.
** This function makes it easy to create numerical ranges that can be
** iterated with the "@@iterator" placeholder function.
** 
** Example usage:
** var rng1 = new Range(2,7);
** new Iterator(rng1).forEach(function(item){ echo(item); });
** // will output values 2 ; 3 ; 4 ; 5 ; 6 ; 7.
*/

function Range (from, to/*, step */) {
	if (this.constructor !== Range)
		throw new Error("Constructor Range requires 'new'");
	
	var step = arguments[2] || 1;
	return {
		"@@iterator" : function (){
			return {
				next: (function(){
					var current = from;
					return function () {
						if (current<=to) {
							var c = current;
							current += step;
							return {value: c, done: false};
						} else {
							return {done: true};
						}
					}
				})()
			};
		}
	};
}
