function void = online(xPoint, yPoint)
	%	online - 4

	%	task 1: plotting data points
	plot(xPoint, yPoint, 'ok', 'markersize', 10);
	title('Online-4 Graph Plotting');
	xlabel('value of x');
	ylabel('value of y');
	grid;
	hold on;

	%	task 2: finding 2nd order regression line and plotting it
	[array, vecDetX, vecDetY, junk] = polynomialReg(xPoint, yPoint, 2, 0);
	plot(vecDetX, vecDetY, 'b', 'linewidth', 4);
	hold on;

	%	task 3: finding n-th order interpolating polynomial using Newton's Method and plotting it
	xExtraPoint = [xPoint(1): 0.1: xPoint(length(xPoint))];
	yExtraPoint = zeros(1, length(xExtraPoint));

	for count = 1: 1: length(xExtraPoint)
		yExtraPoint(count) = newtonPoly(xPoint, yPoint, xExtraPoint(count));
	end

	plot(xExtraPoint, yExtraPoint, 'r', 'linewidth', 4);
	hold on;

	%	task 4: for input xVal, finding yVal from 2nd and 3rd task and print values and plot them on graph
	xVal = input('Input the value of x: ');

	[array, vecX, vecY, y1] = polynomialReg(xPoint, yPoint, 2, xVal);
	y2 = newtonPoly(xPoint, yPoint, xVal);

	fprintf('y1 = %f\n', y1);
	fprintf('y2 = %f\n', y2);

	plot(xVal, y1, 'ok', 'markersize', 10, 'markerfacecolor', 'y');
	plot(xVal, y2, 'ok', 'markersize', 10, 'markerfacecolor', 'g');

	legend('given data points', '2nd order regression line', 'Newton Interpolating Polynomial', 'Point 1', 'Point 2', 'location', 'northeast');
	hold off;

end
