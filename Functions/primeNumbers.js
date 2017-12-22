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
** - Philippe Majerus, November 2017.
*/


// Prime numbers sequence object with "@@iterator" property.
var primeNumbers = {
	"@@iterator": function () {
		return {
			next: (function(){
				function isPrime(number) {
					var divisor = 2;
					var numberSqrt = Math.sqrt(number);
					while (divisor <= numberSqrt)
						if (number % divisor++ == 0) return false;
					return number > 1;
				}
				
				return function () {
					do {
						this._current++
					} while ((Number.MAX_SAFE_INTEGER > this._current) && !isPrime(this._current));
					return (Number.MAX_SAFE_INTEGER > this._current)
						? {value: this._current, done: false}
						: {done: true};
				}
			}()),
			_current: 1
		};
	}
};
