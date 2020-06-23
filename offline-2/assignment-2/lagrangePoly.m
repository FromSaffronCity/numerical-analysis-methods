function yVal = lagrangePoly(xPoint, yPoint, xVal)
	%	function to find the interpolated appx. value of y with respect to given value of x
	%	this function determines an interpolating polynomial of order n for given set of (n+1) data points
	%	the polynomial is known as Lagrange's Interpolating Polynomial
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

	% calculation
	yVal = 0;

	for i = 1: 1: (order+1)
		product = yPoint(i);
		
		for j = 1: 1: (order+1)
			if(i ~= j) 
				product = product*((xVal - xPoint(j))/(xPoint(i) - xPoint(j)));
			end
		end

		yVal = yVal+product;
	end

end