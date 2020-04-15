/*
** JScript 5 does not support ES6 iterators, but we can achieve something very
** similar and provide the familiar iterable .next() with a "@@iterator"
** property instead of the Symbol.iterable property.
** 
** This sample provides a fibonacci object that supports such iteration.
** It provides the Fibonacci sequence from 0 to the maximum integer JavaScript
** can represent without losing precision, which is 79 values.
** 
** Since the for...of statement does not exist, we need to use it explicitely
** as follows:
** for(var iterator=fibonacci["@@iterator"](),item; !(item=iterator.next()).done; ){ echo(item.value); };
** ActiveScript Shell includes a helper function to process these iterators in a way
** that's similar to the .forEach method available on arrays:
** iterate(fibonacci, function(item){ echo(item); });
** 
** AXSH ES6 shim adds some support for these "@@iterator" placeholders:
** echo(Array.from(fibonacci));
** 
** - Philippe Majerus, November 2017, updated April 2020.
*/


// Fibonacci sequence object with "@@iterator" property.
var fibonacci = {
	"@@iterator": function () {
		// Store the state in function closure attached to the returned object
		// This makes these variables only accessible from inside the function
		// and attached to the iterator instance, allowing several independent
		// simultaneous iterators.
		var current = 0;
		var next = 1;
		
		return {
			next: function () {
				var c = current;
				current = next;
				next = c + next;
				return (Number.MAX_SAFE_INTEGER > c)
					? {value: c, done: false}
					: {done: true};
			}
		};
	}
};
