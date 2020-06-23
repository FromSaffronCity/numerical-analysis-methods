x = -0.9: 0.1: 1;

% Plotting for Task 1
plot(x, log(1+x), 'r', 'LineWidth', 3);
hold on;
title('Graph for ln(1+x)');
xlabel('values of x');
ylabel('values of ln(1+x)');
grid;

% Plotting for Task 2
plot(x, naturalLog(x, 1), 'b--', 'LineWidth', 3);
hold on;
plot(x, naturalLog(x, 3), 'c:', 'LineWidth', 3);
hold on;
plot(x, naturalLog(x, 5), 'k-.', 'LineWidth', 3);
hold on;
plot(x, naturalLog(x, 20), 'g', 'LineWidth', 3);
hold off;

legend('y = ln(1+x)', 'y = nLog(x, 1)', 'y = nLog(x, 3)', 'y = nLog(x, 5)', 'y = nLog(x, 20)', 'location', 'southeast');