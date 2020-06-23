% For Graphical Method: plot angleFunction

x = 0: 0.01: 70;  % radian angles - upper limit taken considering the graph
y = 0: 0.01: 70;  % dummy vector

for index = 1: 1: length(x)
	y(index) = angleFunction(x(index));
end

plot(x, y, 'r', 'LineWidth', 2);
title('Graphical Method: Root Finding for Initial Angle');
xlabel('initial angle');
ylabel('angleFunction()');
grid;