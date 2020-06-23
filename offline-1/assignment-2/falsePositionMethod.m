function [root, iteration] = falsePositionMethod(myFunction, xl, xu, error, maxItr) 
	% Applying False Position Method to find root of angleFunction

	rError = 100;
	iteration = 0;

	% Starting the procedure
	for iterationCount = 1: 1: maxItr
		xr = xu - (myFunction(xu)*(xl-xu))/(myFunction(xl)-myFunction(xu));
		iteration += 1;

		% replacement
		if myFunction(xr) == 0
			break
		else if myFunction(xr)*myFunction(xl) > 0
			xl = xr;
		else
			xu = xr;
		end
		
		% error determination
		if iterationCount > 1
			rError = abs((xr - xrp)/xr)*100;
		end

		% checking error
		if rError <= error
			break
		end

		xrp = xr;  % NOTICE
	end

	root = xr;
end

		
		

		