%% Misc
clc;
clear;

%% Generate preferences and run TTC algorithm to obtain allocations
num_agents = 10;
num_objects = 10;
prefs = generatePreferences(num_agents, num_objects);
allocations = iterate(prefs); % You need to implement the runTTC function to execute the TTC algorithm

%% Calculate and plot the Lorenz curve
[x, y] = calculateLorenzCurve(prefs, allocations);

figure;
plot(x, y, 'LineWidth', 2);
hold on;

% Plot the line of perfect equality
plot([0, 1], [0, 1], '--', 'LineWidth', 1);

% Customize the plot
xlabel('Normalized Cumulative Agent Count');
ylabel('Normalized Cumulative Utility');
title('Lorenz Curve for Utility');
legend('Lorenz Curve', 'Line of Perfect Equality');
xlim([0, 1]);
ylim([0, 1]);
grid on;
