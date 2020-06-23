function output = naturalLog(x, iteration)
	% function to determine ln(1+x) according to Taylor Series expansion
	
	% iteration for each item of vector x
	for vectorIndex = 1: 1: length(x)
		
		if x(vectorIndex) <= -1 
			output(vectorIndex) = -99999;  % exception handling
		else
			output(vectorIndex) = 0;
			sign = 1;
			numerator = x(vectorIndex);

			% iteration for the expansion
			for index = 1: 1: iteration
				output(vectorIndex) += (sign*numerator)/index;
				sign = -sign; % changing the sign of the term
				numerator *= x(vectorIndex);
			end
		end
	end
end
		