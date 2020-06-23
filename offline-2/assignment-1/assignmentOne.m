function void = assignmentOne()
	%	First assignment of Offline-2 
	%		input files are read and prepared for operation here
	%
	%	Input:
	%		this function has no input
	%	Ouput:
	%		this function returns nothing


	% reading data from .csv files (NOTICE)
	dataMatTrain = csvread('train.csv', 1, 0);
	dataMatTest = csvread('test.csv', 1, 0);


	%	correction for train.csv (handling missing data)
	avg = sum(dataMatTrain(:, 4))/rows(dataMatTrain);

	for i = 1: 1: rows(dataMatTrain)
		if(dataMatTrain(i, 4) == 0)
			dataMatTrain(i, 4) = avg;
		end
	end

	
	% calling function for main operations
	assignmentOneSub(dataMatTrain);
	assignmentOneSub(dataMatTest);

end