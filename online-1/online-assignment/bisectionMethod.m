function [root, iteration] = bisectionMethod(xl, xu, error, maxItr) 

	relativeError = 100;

	for count = 1: 1: maxItr
		xr = (xu + xl)/2;

		% replacement
		if myFunction(xr) == 0
			break
		else if myFunction(xr)*myFunction(xl) > 0
			xl = xr;
		else
			xu = xr;
		end
		
		% error determination
		if count > 1
			relativeError = abs((xr - xrPrevious)/xr)*100;
		end

		% checking error
		if relativeError <= error
			break
		end

		xrPrevious = xr;  % NOTICE
	end

	root = xr;
	iteration = count;
end

		
		

		