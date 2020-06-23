% Graphical Method

x = -7.5: 0.1: 7.5;
y = [0]; 

for index = 1: 1: length(x)
	y(index) = myFunction(x(index));
end

plot(x, y, 'r', 'LineWidth', 2);
title(' f(x) vs x graph');
xlabel('value of x');
ylabel('value of y');
grid;