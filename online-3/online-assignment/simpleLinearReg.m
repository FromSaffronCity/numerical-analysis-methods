function [slope, intercept, cofd] = simpleLinearReg(vecX, vecY)
	%	function to find the best fitting straight line for the given set of data
	%	input:
	%		vecX = vector of observed x
	%		vecY = vector of observed y
	%	output:
	%		slope = slope of best fitting straight line
	%		intercept = intercept of the straight line (Y-axis)
	%		cofd = coefficient of determination
	
	if(length(vecX) ~= length(vecY))
		%	error - invalid given data
		error('vecX and vecY must have same length');
	end

	size = length(vecX);
	
	sumX = sum(vecX);
	sumY = sum(vecY);
	sumXY = sum(vecX.*vecY);
	sumX2 = sum(vecX.*vecX);
	sumY2 = sum(vecY.*vecY);

	slope = (size*sumXY - sumX*sumY)/(size*sumX2 - sumX^2);
	intercept = sumY/size - slope*(sumX/size);

	cofd = (size*sumXY - sumX*sumY)/(sqrt(size*sumX2 - sumX^2) * (sqrt(size*sumY2 - sumY^2)));
	cofd = (cofd^2) * 100;

	fprintf('Straight Line: y = %f.x + %f\n', slope, intercept)

	% Plotting Straight Line along with the curve
	vecDetX = linspace(min(vecX), max(vecX), 100);
	vecDetY = zeros(length(vecDetX));

	vecDetY = intercept + slope*vecDetX;	% NOTICE

	plot(vecX, vecY, 'o');
	title('Linear Regression');
	xlabel('value of x');
	ylabel('value of y');
	grid;
	hold on;

	plot(vecDetX, vecDetY, 'r');
	hold off;
end