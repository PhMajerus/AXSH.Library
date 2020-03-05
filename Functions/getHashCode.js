/*
** Variant hash function.
** Returns an int32 hash code for any kind of variant.
** 
** A hash code is suitable for use in algorithms and data structures that use
** hash codes, such as a hash table. A hash code is not a permanent value, it
** shouldn't be used across process or COM apartments, as objects and proxies
** will give different values.
** 
** There is a hidden hashing method exposed by the "Scripting.Dictionary"
** object which support all kind of variants, even those referencing objects.
** It automatically uses the proper internal hashing function based on
** primitive value or pointer address.
** This wrapper is provided for ease of use and documentation, if you need to
** hash many values, using a single instance of the Dictionary object is more
** efficient.
*/


function getHashCode(val) {
	if (arguments.length < 1) {
		throw new Error("val argument must be provided");
	}
	return new ActiveXObject("Scripting.Dictionary").hashVal(val);
}
