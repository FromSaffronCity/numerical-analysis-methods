function [root, iteration] = secantMethod(myFunction, ig1, ig2, error, maxItr) 
	% Applying False Position Method to find root of angleFunction

	arError = 100;
	iteration = 0;

	% Starting the procedure
	for iterationCount = 1: 1: maxItr
		appxRoot = ig2 - (myFunction(ig2)*(ig1-ig2))/(myFunction(ig1)-myFunction(ig2));
		iteration += 1;

		% replacement
		ig1 = ig2;
		ig2 = appxRoot;
		
		% error determination
		if iterationCount > 1
			arError = abs((appxRoot - previous)/appxRoot)*100;
		end

		% checking error
		if arError <= error
			break
		end

		previous = appxRoot;  % NOTICE
	end

	root = appxRoot;
end