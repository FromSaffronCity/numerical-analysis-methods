function solve = GaussSeidel(A, B, error, maxIteration)

	% GaussSeidel: Gauss Seidel method for solving a set of linear equations (must be converging)
	% input:
	% 		A = coefficient matrix
	%  	B = right hand side vector
	%  	error = relative approximate error (termination criterion)
	%  	maxIteration = max iteration
	% output:
	%  	solve = solution vector

	[row, column] = size(A);

	if row ~= column
		error('Matrix A must be square'); 
	end

	solve = zeros(column, 1);
	
	errorMatrix = ones(column, 1);  % NOTICE - relative approximate error (each iteration for each variable)
	errorMatrix;  % print Error Matrix
	errMatrix = ones(column, 1);  % NOTICE - relative actual error (each iteration for each variable) 
	iteration=0;

	appxError = zeros(column, maxIteration);  % for each variable for each iteration  
	actualError = zeros(column, maxIteration);  % for each variable for each iteration
	actualSolve = GaussJordan(A,B);

	while (max(errorMatrix) > error) && (iteration < maxIteration)
		iteration = iteration+1;  % iteration counter
		previousSolve = solve;  % NOTICE - save current values to calculate error later
		previousSolve;  % print previous solve

		% main part
		for itr = 1: 1: column
			index = 1: 1: column;  % NOTICE

			tempSolve = solve; 
			tempSolve;  % print temporary solve

			solve(itr) = (B(itr) - A(itr, index)*tempSolve + A(itr, itr)*tempSolve(itr))/ A(itr,itr);  % IMPORTANT - main calculation
			solve;  % print solve
			
			errorMatrix(itr) = abs((solve(itr) - previousSolve(itr))/solve(itr))*100;  %  approximate error
			errMatrix(itr) = abs((actualSolve(itr) - solve(itr))/actualSolve(itr))*100;  %  actual error

			errorMatrix;  % print error matrix
			errMatrix;  % print err matrix
		end

		appxError(:, iteration) = errorMatrix;  % NOTICE
		actualError(:, iteration) = errMatrix;  % NOTICE
	end 

	errorMatrix = errorMatrix';  % print error matrix
	errMatrix = errMatrix';  % print err matrix
	actualError;  % print actual error matrix
	appxError;  % print approximate error matrix_type
	iteration % print total iteration needed

	solve = solve';  % NOTICE - transposed here
end

