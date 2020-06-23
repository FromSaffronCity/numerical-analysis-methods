function X = GaussPivot(A,B)

	% GaussPivot: Gauss elimination with pivoting (partial)
	% input:
	% 	A = coefficient matrix
	% 	B = right hand side vector
	% output:
	% 	X = solution vector

	[row,column] = size(A);  % NOTICE

	if row ~= column
		error('Matrix A must be square'); 
	end

	newColumn = column+1;
	mergedMatrix = [A B];  % merging two matrices A nd B
	mergedMatrix;  % NOTICE - print Matrix

	% forward elimination
	for step = 1: 1: column-1
		% partial pivoting
		[big,index] = max(abs(mergedMatrix(step:row, step)));  
		% big = largest element & index = index of that element
		idx = index+step-1;  % NOTICE

		if idx ~= step
			mergedMatrix([step,idx],:) = mergedMatrix([idx,step],:);  % swapping
			mergedMatrix;  % NOTICE? - print Matrix
		end

		%  main operation occurs
		for i = step+1: 1: row
			factor = mergedMatrix(i,step)/mergedMatrix(step,step);  % IMPORTANT
			mergedMatrix(i, step:newColumn) = mergedMatrix(i, step:newColumn) - factor*mergedMatrix(step, step:newColumn);
			mergedMatrix;  % NOTICE - print Matrix
		end
	end

	% back substitution
	X = zeros(column, 1);
	X(row) = mergedMatrix(row, newColumn)/mergedMatrix(row, column);  % NOTICE

	for i = row-1:-1:1
		X(i) = (mergedMatrix(i, newColumn) - mergedMatrix(i,i+1:column)*X(i+1:row))/mergedMatrix(i,i);  % NOTICE
	end

	X = X';
end

