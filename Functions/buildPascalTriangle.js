/*
** Pascal's triangle generation function
** 
** This function generated a triangular array of the binomial coefficients.
** 
** The following array of arrays is returned:
** 0:              1
** 1:            1   1
** 2:          1   2   1
** 3:        1   3   3   1
** 4:      1   4   6   4   1
** ...:  .   .   .   .   .   .
** 
** You can show a Pascal's triangle on screen using the following command:
** echo( buildPascalTriangle(13).map(function(row){ return row.reduce(function(acc,item){ return acc+(item+"").padEven(6); },"").padEven(80); }).join("\r\n") );
** 
** which is equivalent to the following more readable code:
** echo(
**     buildPascalTriangle(13).map( function (row) {
**         return row.reduce( function (acc, item) {
**             return acc + (item+"").padEven(6);
**         }, "").padEven(80);
**     }).join("\r\n")
** );
** 
** - Philippe Majerus, May 2018
*/

function buildPascalTriangle(rows) {
	if (rows === undefined)
		rows = 10;
	if (rows < 1) {
		var e = new TypeError("rows argument must be greater than zero");
		e.description = e.message;
		throw e;
	}
	
	var triangle = [];
	triangle[0] = [1];
	for (var i = 1; i < rows; i++) {
		triangle[i] = (function /*buildRow*/ (row){
			var nextRow = new Array(row.length+1);
			var i = 0;
			nextRow[i] = row[i];
			i++;
			while (i < row.length) {
				nextRow[i] = (row[i-1] + row[i]);
				i++;
			}
			nextRow[i] = row[i-1];
			
			return nextRow;			
		})(triangle[i-1]);
	}
	return triangle;
}
