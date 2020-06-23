% Task- plotting graph showing relative appx. error

previousValue = naturalLog(0.5,1);
iteration = 1: 1: 50;
error = 1: 1: 50; % dummy values inserted
error(1) = 0;  % index starts with 1

% iteration starts
for index = 2: 1: length(iteration)
	currentValue = naturalLog(0.5, index);
	error(index) = abs((currentValue - previousValue)/currentValue) * 100;
	previousValue = currentValue;
end;

plot(iteration, error, 'r', 'LineWidth', 3); % two vectors must be passed to plot()
title('Relative Approximate Error for each iteration');
xlabel('iteration');
ylabel('relative appx. error');
grid;