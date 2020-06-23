function inversedMatrix = Inverse(A)

	% Inverse: determine the inverse of the input "square" matrix A
	% input: A = any square matrix
	% output: inversedMatrix = inverse of A

	[row, column] = size(A);

	if row ~= column
		error('Matrix A must be square');
	end

	% NOTICE below
	L = zeros(row, column);
	U = zeros(row, column);

	U(1, :) = A(1, :);
	L(:, 1) = A(:, 1)/U(1, 1);  % NOTICE
	L(1, 1) = 1;


	% NOTICE - LU Decomposition
	for k = 2: 1: row
		for i = 2: 1: row
			for j = i: 1: row
				U(i, j)=A(i, j)-dot(L(i, 1:i-1),U(1:i-1, j));  % NOTICE - learn later
			end

			L(i, k)=(A(i, k)-dot(L(i, 1:k-1),U(1:k-1, k)))/U(k, k);  % NOTICE - learn later
		end
	end
	% LU decomposition ends here (learn later)

	newColumn = column+1;
	inversedMatrix = zeros(row, column);

	% NOTICE - New Process
	for i=1: 1: column
		B = zeros(column, 1);
		B(i)=1;    
		mergedMatrix = [L B];  % pre-requisite for forward substitution

		L;  % print L matrix
		U;  % print U matrix
		mergedMatrix;  % print merged matrix


		% forward substitution
		D = zeros(column, 1);
		D(1) = mergedMatrix(1, newColumn)/mergedMatrix(1,1);

		for itr = 2: 1: column
			D(itr) = (mergedMatrix(itr, newColumn) - mergedMatrix(itr, 1:itr-1)*D(1:itr-1))/mergedMatrix(itr, itr);
		end

		D;  % print D matrix
		mergedMatrix = [U D];  % pre-requisite for back substitution
		mergedMatrix;  % print merged matrix_type


		% back substitution
		X = zeros(column, 1);
		X(column) = mergedMatrix(column, newColumn)/mergedMatrix(column, column);

		for itr = column-1: -1: 1
			X(itr)=(mergedMatrix(itr, newColumn) - mergedMatrix(itr, itr+1:column)*X(itr+1:column))/mergedMatrix(itr, itr);
		end

		X;  % print X matrix
		inversedMatrix(:, i) = X;
		inversedMatrix;  % print inversed matrix
	end

	inversedMatrix;  % print inversed matrix
end
