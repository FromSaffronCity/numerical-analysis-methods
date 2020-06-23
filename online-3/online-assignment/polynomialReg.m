function [array, cofd] = polynomialReg(vecX, vecY, degree)
	% function to find the best fitting locus for the given set of data
	%	input:
	%		vecX = vector containging observed x
	%		vecY = vector containg observed y
	%		degree = degree of the polynomial
	%	output:
	%		array = vector of coefficients
	%		cofd = coefficient of determination (r2)

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

	% plotting
	plot(vecX, vecY, 'o');
	title('Polynomial Regression');
	xlabel('value of x');
	ylabel('value of y');
	grid;
	hold on;

	vecDetX = linspace(min(vecX), max(vecX), 200);
	vecDetY = zeros(1, length(vecDetX));

	for count = 1: 1: length(vecDetX)
		Sum = 0;

		for counter = 1: 1: (degree+1)
			Sum = Sum + array(counter) * (vecDetX(count)^(counter-1));
		end

		vecDetY(count) = Sum;
	end
		
	plot(vecDetX, vecDetY, 'r');
	hold off;

	% error finding
	St = 0;
	Sr = 0;

	for count = 1: 1: size
		St += (vecY(count) - sum(vecY)/size)^2;
	end

	for count = 1: 1: size
		Sum = 0;

		for counter = 1: 1: (degree+1)
			Sum = Sum + array(counter)*(vecX(count)^(counter-1));
		end

		Sr += (vecY(count) - Sum)^2;
	end

	cofd = ((St - Sr)/St) * 100;
end
			
			