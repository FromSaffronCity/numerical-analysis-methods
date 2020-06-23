function X = GaussJordan(A,B)

	% GaussJordan: Gauss elimination pivoting
	% input:
	% 	A = coefficient matrix
	% 	B = right hand side vector
	% output:
	% 	X = solution vector

	[row, column] = size(A);

	if row ~= column
		error('Matrix A must be square'); 
	end

	newColumn = column+1;
	mergedMatrix = [A B];
	mergedMatrix;  % print Matrix

	% forward elimination
	for step = 1: 1: row-1
		% partial pivoting
		[big,index] = max(abs(mergedMatrix(step:row, step)));
		idx = index+step-1;

		if idx~=step
			mergedMatrix([step, idx],:) = mergedMatrix([idx, step],:);  % NOTICE - Swapping
			mergedMatrix;  % print Matrix
		end

		% main operation occurs
		for i = step+1: 1: row
			factor = mergedMatrix(i,step)/mergedMatrix(step,step);  % IMPORTANT
			mergedMatrix(i, step:newColumn) = mergedMatrix(i, step:newColumn)-factor*mergedMatrix(step, step:newColumn);  
			% Row - Row
			mergedMatrix;  % print Matrix
	    end
	end

	% NOTICE - it changes from GaussPivot from here
	for i = 1: 1: row-1
		for index = i+1: 1: column
			% for nullifying the elements of rows except for pivot(X) and constant(B)
			mergedMatrix(i,:) = mergedMatrix(i,:)-mergedMatrix(index,:)*(mergedMatrix(i,index)/mergedMatrix(index,index));
			mergedMatrix;  % print Matrix
		end
	end

	% preparing X
	X = zeros(column, 1);

	for index = 1: 1: row
		mergedMatrix(index,:) = mergedMatrix(index,:)/mergedMatrix(index,index);  % Normalization - Important
		mergedMatrix;  % print Matrix
		X(index) = mergedMatrix(index, newColumn);  % NOTICE
	end

	X = X';
end