function void = assignmentOneSub(dataMatrix)
	%	first assignment of Offline-2 (auxiliary part)
	%		main operations are accomplished here
	%	
	%	Input:
	%		dataMatrix = matrix containing given sets of data
	%	Output:
	%		this function returns nothing


	%	task-1 (NOTICE: graph plotting)
	figure;	%	NOTICE
	scatter(dataMatrix(:, 1), dataMatrix(:, 2), dataMatrix(:, 5)/10, dataMatrix(:, 7), 'filled');
	object = colorbar;
	title('Task-1 Graph', 'Fontsize', 20, 'Fontweight', 'bold', 'color', 'r');
	xlabel('Longitude', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel('Latitude', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel(object, 'Median House Value', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	legend('Population', 'location', 'northeast');
	grid;


	%	task-2 (multiple linear regression and showing equation)
	array = multipleLinearReg(dataMatrix, columns(dataMatrix)-1);
	
	%	printing equation
	fprintf('equation: y = %f + %fx1 + %fx2 + %fx3 + %fx4 + %fx5 + %fx6\n', array(1,1), array(2,1), array(3,1), array(4,1), array(5,1), array(6,1), array(7,1));

	
	%	task-3 (calculating root means square error-RMSE for given sets of data after multiple linear regression)
	sum = 0;

	%	main part
	for i=1: 1: rows(dataMatrix)
		temp = array(1,1) + array(2,1)*dataMatrix(i,1) + array(3,1)*dataMatrix(i,2) + array(4,1)*dataMatrix(i,3) + array(5,1)*dataMatrix(i,4) + array(6,1)*dataMatrix(i,5) + array(7,1)*dataMatrix(i,6);
		sum += (dataMatrix(i,7) - temp)*(dataMatrix(i,7) - temp);
	end

	RMSE = sqrt(sum/rows(dataMatrix));

	fprintf('root means square error: %f\n\n', RMSE);
	
end