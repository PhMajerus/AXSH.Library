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
** 
** AXSH ES6 shim adds some support for these "@@iterator" placeholders:
** echo(Array.from(fibonacci));
** 
** - Philippe Majerus, November 2017.
*/


// Fibonacci sequence object with "@@iterator" property.
var fibonacci = {
	"@@iterator": function(){
		return {
			next: function()
			{
				var current = this._current;
				this._current = this._next;
				this._next = current + this._next;
				return Number.MAX_SAFE_INTEGER > current ?
					{value: current, done: false} :
					{done: true};
			},
			_current: 0,
			_next: 1
		};
	}
};
