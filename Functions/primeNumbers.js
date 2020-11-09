/*
** JScript 5 does not support ES6 iterators, but we can achieve something very
** similar and provide the familiar iterable .next() with a "@@iterator"
** property instead of the Symbol.iterable property.
** 
** This sample provides a primeNumbers object that supports such iteration.
** It provides the sequence of prime numbers.
** The iterator stops at 9007199254740881, which is the largest prime number
** JavaScript can represent without losing precision, as after that point
** integer maths cannot be trusted to the individual digit anymore.
** You're unlikely to ever need to go that far though.
** 
** Since the for...of statement does not exist, we need to use it explicitely
** as follows:
** for(var iterator=primeNumbers["@@iterator"](),item; !(item=iterator.next()).done; ){ echo(item.value); };
** 
** A function is also available in AXSH to compensate for the lack of for...of
** iterate(primeNumbers, function(number){ echo(number) });
** 
** The object also provides async iterator support:
** for (var asyncIterator=primeNumbers["@@asyncIterator"](),item; !(item=await(asyncIterator.next())).done; ){ echo(item.value); };
** 
** A function is also available in AXSH to compensate for the lack of for await...of
** asyncIterate(primeNumbers, function(number){ echo(number) });
** 
** - Philippe Majerus, November 2017, updated to add async in November 2020
*/


// Prime numbers sequence object with "@@iterator" property.
var primeNumbers = (function(){
	
	// Helper function to check if a number is a prime number
	function isPrime(number) {
		var divisor = 2;
		var numberSqrt = Math.sqrt(number);
		while (divisor <= numberSqrt)
			if (number % divisor++ == 0) return false;
		return number > 1;
	}
	
	return {
		"@@iterator": function () {
			return {
				next: function () {
						do {
							this._current++
						} while ((Number.MAX_SAFE_INTEGER > this._current) && !isPrime(this._current));
						return (Number.MAX_SAFE_INTEGER > this._current)
							? {value: this._current, done: false}
							: {done: true};
				},
				_current: 1
			};
		},
		
		// Since calculating prime numbers can take a while, also provide an asynchronous iterator
		"@@asyncIterator": function() {
			return {
				next: async(function(){
					var _this = this;
					return new Promise(function(resolve,reject) {
						do {
							_this._current++
						} while ((Number.MAX_SAFE_INTEGER > _this._current) && !isPrime(_this._current));
						resolve((Number.MAX_SAFE_INTEGER > _this._current)
							? {value: _this._current, done: false}
							: {done: true});
					});
				}),
				_current: 1
			};
		}
	};
	
})();
