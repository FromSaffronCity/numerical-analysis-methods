function X = LU(A, B)

	% LU: LU decomposition method for solving a set of linear equations
	% input:
	% 		A = coefficient matrix
	%  	B = right hand side vector
	% output:
	%  	X = solution vector


	[row, column] = size(A);

	if row ~= column
		error('Matrix A must be square'); 
	end

	% NOTICE below	
	L = zeros(row, column);
	U = zeros(row, column);

	U(1, :) =A(1, :);
	L(:, 1) = A(:, 1)/U(1, 1);  % NOTICE
	L(1, 1) = 1;


	% NOTICE - LU Decomposition
	for k = 2: 1: row
		for i = 2: 1: row
			for j = i: 1: row
				U(i, j) = A(i, j)-dot(L(i, 1:i-1),U(1:i-1, j));  % NOTICE - try to understand
			end

			L(i, k)=(A(i, k)-dot(L(i, 1:k-1),U(1:k-1,k)))/U(k, k);  % NOTICE - try to understand
		end
	end
	% LU Decomposition ends here (try to understand later)


	newColumn = column+1;
	mergedMatrix = [L B];  % NOTICE - preparation for Forward Substitution
	L;  % print L
	U;  % print U
	mergedMatrix;  % print merged matrix


	% forward substitution
	D = zeros(column, 1);  % NOTICE - See Book (Page: 275)
	D(1) = mergedMatrix(1, newColumn)/mergedMatrix(1, 1);

	for i = 2: 1: row
		D(i) = (mergedMatrix(i, newColumn) - mergedMatrix(i, 1:i-1)*D(1:i-1))/mergedMatrix(i,i);
	end


	D;  % print D matrix
	mergedMatrix = [U D];  % NOTICE - preparation for back substitution
	mergedMatrix;  % print merged matrix


	% back substitution
	X = zeros(column, 1);
	X(column) = mergedMatrix(row, newColumn)/mergedMatrix(row, column);

	for i = row-1: -1: 1
		X(i) = (mergedMatrix(i, newColumn) - mergedMatrix(i, i+1:column)*X(i+1:column))/mergedMatrix(i, i);
	end

	X = X';  % transposing solution vector
end
