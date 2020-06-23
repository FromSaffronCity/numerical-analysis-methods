function [array] = multipleLinearReg(dataMatrix, number)
	%	function to find the best-fitting n-th dimension for the given set of data
	%	here, n = number = total number of independent variables
	%	Linear System of Equations with one dependent and n independent variables is used
	%		where, coefficients are considered unkown values and values given are considered coefficients
	%		so, we have (n+1) linear equations for n independent variables and (n+1) unkown coefficients
	%		here, each equation has (n+1) temrs in total
	%	hence, the process is called Multiple Linear Regression
	%
	%	Input:
	%		dataMatrix = containing all given sets of data 
	%		number = number of independent variables
	%
	%	Output:
	%		array = array/vector of coefficients


	%	data extraction
	if(columns(dataMatrix) ~= number+1)
		error('Invalid Input');
	end


	%	Calculating Coefficients
	leftMat = zeros(number+1, number+1);
	rightMat = zeros(number+1, 1);
	array = zeros(number+1, 1);

	%	Here: leftMat*array = rightMat

	% NOTICE: calculating leftMat
	for i = 1: 1: (number+1)
		for j = 1: 1: (number+1)
			if(i==1 && j==1)
				leftMat(i, j) = rows(dataMatrix);
			end

			if(i==1 && j~=1)
				leftMat(i, j) = sum(dataMatrix(:, j-1));
			end

			if(i~=1 && j==1)
				leftMat(i, j) = sum(dataMatrix(:, i-1));
			end

			if(i~=1 && j~=1)
				temp1 = dataMatrix(:, i-1);
				temp2 = dataMatrix(:, j-1);
				
				leftMat(i, j) = sum(temp1.*temp2);
			end
		end
	end

	% calculating rightMat
	for i = 1: 1: (number+1)
		if(i == 1)
			rightMat(i, 1) = sum(dataMatrix(:, number+1));
		end
		if(i ~= 1)
			temp1 = dataMatrix(:, i-1);
			temp2 = dataMatrix(:, number+1);

			rightMat(i, 1) = sum(temp1.*temp2);
		end
	end

	%	calculating array
	array = inv(leftMat)*rightMat;
			
end