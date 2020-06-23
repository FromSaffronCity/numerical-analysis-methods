function [array, vecDetX, vecDetY, yVal] = polynomialReg(vecX, vecY, degree, xVal)
	% function to find the best fitting locus for the given set of data
	%	input:
	%		vecX = vector containging observed x
	%		vecY = vector containg observed y
	%		degree = degree of the polynomial
	%	output:
	%		array = vector of coefficients

	if(length(vecX) ~= length(vecY))
		error('vecX and vecY must be of same length');
	end

	size = length(vecX);
	matVar = zeros(degree+1, degree+1);
	vecRight = zeros(degree+1, 1);

	for count = 1: 1: (degree+1)
		for counter = 1: 1: (degree+1)
			temp = vecX.^(count+counter-2);
			matVar(count, counter) = sum(temp);
		end

		temp = vecX.^(count-1);
		temp = temp.*vecY;
		vecRight(count) = sum(temp);
	end

	array = inv(matVar) * vecRight;	% IMPORTANT

	% data processing
	vecDetX = linspace(min(vecX), max(vecX), 200);
	vecDetY = zeros(1, length(vecDetX));

	for count = 1: 1: length(vecDetX)
		sum = 0;

		for counter = 1: 1: (degree+1)
			sum = sum + array(counter) * (vecDetX(count)^(counter-1));
		end

		vecDetY(count) = sum;
	end

	% for xVal
	yVal = 0;

	for count = 1: 1: (degree+1)
		yVal = yVal + array(count)*(xVal^(count-1));
	end
		
end
			
			