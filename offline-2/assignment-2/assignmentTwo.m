function void = assignmentTwo()
	%	Second assignment of Offline-2
	%		collection of data from given data file and processing data for further operations are done first
	%		then, main operations are accomplished using processed data
	%
	%	Input:
	%		this function has no input
	%	Output:
	%		this function returns nothing


	% reading data from input data (.csv) file
	dataMatrix = csvread('shampoo.csv', 1, 0);

	% finding number of missing data and preparing matrix with only known data
	number = index = idx = 0;

	for i = 1: 1: rows(dataMatrix)
		if(dataMatrix(i, 2) == 0)
			number++;
		end
	end

	dataMat = zeros(rows(dataMatrix)-number, 2);
	missMat = zeros(number, 2);

	for i = 1: 1: rows(dataMatrix)
		if(dataMatrix(i, 2) ~= 0)
			dataMat(++index, 1) = dataMatrix(i, 1);
			dataMat(index, 2) = dataMatrix(i, 2);
		end

		if(dataMatrix(i, 2) == 0)
			missMat(++idx, 1) = dataMatrix(i, 1);
		end
	end

	
	%	task-1 (plotting graph to show all given data visually)
	figure;	%	NOTICE
	plot(dataMat(:, 1), dataMat(:, 2), 'ok', 'markersize', 10, 'markerfacecolor', 'g');
	title('Graph: Given Sets of Data Points', 'Fontsize', 20, 'Fontweight', 'bold', 'color', 'r');
	xlabel('Month', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel('Sales of Shampoo', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	grid;
	hold on;

	plot(missMat(:, 1), missMat(:, 2), 'ok', 'markersize', 10, 'markerfacecolor', 'r');
	legend('Given Data Point', 'Missing Data Point', 'location', 'north');
	hold off;


	%	task-2 & task-3 (plotting interpolating polynomial for given data sets and finding missing value)
	vecX = [1: 0.1: 36];
	vecY = zeros(1, length(vecX));

	% Newton's Finite Divided Difference Interpolating Polynomial
	for i = 1: 1: length(vecX)
		vecY(1, i) = newtonPoly(dataMat(:, 1), dataMat(:, 2), vecX(1, i));
	end

	figure;
	plot(vecX, vecY, 'b', 'linewidth', 5);
	title('Interpolation by Newton Polynomial', 'Fontsize', 20, 'Fontweight', 'bold', 'color', 'r');
	xlabel('Month', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel('Sales of Shampoo', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	grid;
	hold on;
	
	fprintf('Approximated values from Newton Method:\n');

	for i = 1: 1: rows(missMat)
		missMat(i, 2) = newtonPoly(dataMat(:, 1), dataMat(:, 2), missMat(i, 1));
		fprintf('appx. value for %f: %f\n', missMat(i, 1), missMat(i, 2));
		plot(missMat(i, 1), missMat(i, 2), 'ok', 'markersize', 10, 'markerfacecolor', 'y');
	end

	fprintf('\n');
	legend('Interpolating Polynomial', 'Approximated Data Points', 'location', 'north');
	hold off;

	
	%	Lagrange's Interpolating Polynomial
	for i = 1: 1: length(vecX)
		vecY(1, i) = lagrangePoly(dataMat(:, 1), dataMat(:, 2), vecX(1, i));
	end

	figure;
	plot(vecX, vecY, 'b', 'linewidth', 5);
	title('Interpolation by Lagrange Polynomial', 'Fontsize', 20, 'Fontweight', 'bold', 'color', 'r');
	xlabel('Month', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel('Sales of Shampoo', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	grid;
	hold on;
	
	fprintf('Approximated values from Lagrange Method:\n');

	for i = 1: 1: rows(missMat)
		missMat(i, 2) = lagrangePoly(dataMat(:, 1), dataMat(:, 2), missMat(i, 1));
		fprintf('appx. value for %f: %f\n', missMat(i, 1), missMat(i, 2));
		plot(missMat(i, 1), missMat(i, 2), 'ok', 'markersize', 10, 'markerfacecolor', 'm');
	end

	fprintf('\n');
	legend('Interpolating Polynomial', 'Approximated Data Points', 'location', 'north');
	hold off;


	%	Linear Spline Interpolation
	for i = 1: 1: length(vecX)
		vecY(1, i) = linearSplineBrute(dataMat(:, 1), dataMat(:, 2), vecX(1, i));
	end

	figure;
	plot(vecX, vecY, 'b', 'linewidth', 5);
	title('Interpolation by Linear Spline', 'Fontsize', 20, 'Fontweight', 'bold', 'color', 'r');
	xlabel('Month', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel('Sales of Shampoo', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	grid;
	hold on;
	
	fprintf('Approximated values from Linear Spline Interpolation:\n');

	for i = 1: 1: rows(missMat)
		missMat(i, 2) = linearSplineBrute(dataMat(:, 1), dataMat(:, 2), missMat(i, 1));
		fprintf('appx. value for %f: %f\n', missMat(i, 1), missMat(i, 2));
		plot(missMat(i, 1), missMat(i, 2), 'ok', 'markersize', 10, 'markerfacecolor', 'w');
	end

	fprintf('\n');
	legend('Interpolating Polynomial', 'Approximated Data Points', 'location', 'north');
	hold off;


	%	Quadratic Spline Interpolation
	for i = 1: 1: length(vecX)
		vecY(1, i) = quadPolation(dataMat(:, 1), dataMat(:, 2), vecX(1, i));
	end

	figure;
	plot(vecX, vecY, 'b', 'linewidth', 5);
	title('Interpolation by Quadratic Spline', 'Fontsize', 20, 'Fontweight', 'bold', 'color', 'r');
	xlabel('Month', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	ylabel('Sales of Shampoo', 'Fontsize', 15, 'Fontweight', 'bold', 'color', 'k');
	grid;
	hold on;
	
	fprintf('Approximated values from Quadratic Spline Interpolation:\n');

	for i = 1: 1: rows(missMat)
		missMat(i, 2) = quadPolation(dataMat(:, 1), dataMat(:, 2), missMat(i, 1));
		fprintf('appx. value for %f: %f\n', missMat(i, 1), missMat(i, 2));
		plot(missMat(i, 1), missMat(i, 2), 'ok', 'markersize', 10, 'markerfacecolor', 'c');
	end

	fprintf('\n');
	legend('Interpolating Polynomial', 'Approximated Data Points', 'location', 'north');
	hold off;
	
end