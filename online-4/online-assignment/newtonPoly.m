function yVal = newtonPoly(xPoint, yPoint, xVal)
	%	function to find the interpolated appx. value of y with respect to given value of x
	%	this function determines an interpolating polynomial of order n for given set of (n+1) data points 
	%	the polynomial is known as Newton's Finite Divided Difference Interpolating Polynomial
	%
	%	input:
	%		xPoint = set of (n+1) x's
	%		yPoint = set of (n+1) corresponding y's
	%		xVal = given value of x (independent variable)
	%	output:
	%		yVal = interpolated appx. value of y (dependent variable)

	order = length(xPoint) - 1;

	if(order ~= length(yPoint)-1)
		error('xPoint and yPoint must be of same length');
	end

	%	finite divided differences are tabulated here in table
	%	after the tabulation, the first row of the table will contain the finite divided differences
	%		f[Xi, Xi-1, ..., Xo] where i = #column - 1
	%	determined finite divided differences are used in further calculations later

	table = zeros(order+1, order+1);

	%	assigning values of y in first column of table
	table(:, 1) = yPoint(:);	%	NOTICE

	for column = 2: 1: (order+1)
		for row = 1: 1: (order+2-column)
			table(row, column) = (table(row+1, column-1) - table(row, column-1))/(xPoint(row+column-1) - xPoint(row));
		end
	end

	%	calculation
	multiple = 1;
	yVal = table(1,1);	% 0-th term

	for count = 1: 1: order
		multiple = multiple*(xVal - xPoint(count));
		yVal = yVal + multiple*table(1, count+1);
	end

end
	