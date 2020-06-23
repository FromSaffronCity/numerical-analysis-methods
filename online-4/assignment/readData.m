%	Script File to read the input data points from text file

%	name of input text file
inputFile = 'input.txt';

%	loading data from input file
inputData = load(inputFile, '-ascii');

%	writing data
xPoint = inputData(:, 1);	%	NOTICE
yPoint = inputData(:, 2);	%	NOTICE

%	call the function from here
xVal = 2.5;	%	assuming

yVal1 = newtonPoly(xPoint, yPoint, xVal);
yVal2 = lagrangePoly(xPoint, yPoint, xVal);
yVal3 = linearSpline(xPoint, yPoint, xVal);

%	plotting only
plot(xVal, yVal1, 'o');
gird;
hold on;

plot(xVal, yVal2, 'o');
hold on;

plot(xVal, yVal3, 'o');
hold off;
