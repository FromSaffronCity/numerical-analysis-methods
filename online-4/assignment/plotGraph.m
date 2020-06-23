function void = plotGraph(xPoint, yPoint)
	% function to plot graph f_test_regression
	%
	%	input:
	%		xPoint = set of given data points of x
	%		yPoint = set of given data points of y
	%	output:
	%		this function returns nothing

	%	creating a new vector for data points (independent variable)
	xNewPoint = [xPoint(1): 0.1: xPoint(length(xPoint))];

	%	creating new vector for data points (dependent variable)
	yNewPoint = zeros(1, length(xNewPoint));
	
	%	plotting points
	plot(xPoint, yPoint, 'o');
	grid;
	hold on;

	%	plotting interpolating locus from Linear Spline Interploation
	for count = 1: 1: length(xNewPoint)
		yNewPoint(count) = linearSplineBrute(xPoint, yPoint, xNewPoint(count));
	end

	plot(xNewPoint, yNewPoint);
	hold on;

	%	plotting interpolating locus from Newton Interpolation
	yNewtPoint = zeros(1, length(xNewPoint));

	for count = 1: 1: length(xNewPoint)
		yNewtPoint(count) = quadPolation(xPoint, yPoint, xNewPoint(count));
	end

	plot(xNewPoint, yNewtPoint);
	hold off;

end

	

	