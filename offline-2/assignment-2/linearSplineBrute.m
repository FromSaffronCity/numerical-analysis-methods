function yVal = linearSplineBrute(xPoint, yPoint, xVal)
	%	function to find the interpolated appx. value of dependent variable (y) 
	%		from given value of independent variable (x)
	%	Linear Spline is the approach here
	%
	%	Input:
	%		xPoint = given set holding data values of x
	%		yPoint = given set holding data values of y
	%		xVal = given value of x
	%	Output:
	%		yVal = interpolated appx. value of y

	if(xVal<xPoint(1) || xVal >xPoint(length(xPoint)))
		error('interpolation outside range');
	end

	%	Linear Search
	index = 1;

	while(1)
		if(xVal <= xPoint(index+1))
			break;
		end

		index = index+1;
	end

	%	linear Interpolation
	yVal = yPoint(index) + ((yPoint(index+1) - yPoint(index))/(xPoint(index+1) - xPoint(index)))*(xVal - xPoint(index));

end