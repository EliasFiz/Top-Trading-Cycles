% Util Distribution for each agent test (should be uniform)

%% Misc
clc
clear

%% Set the number of agents, objects, iterations and start timer
num_agents = 100;
num_objects = 100;
iterations = 10000;

tic

all_utilities = [];

x = [1:iterations];

count = 0;

%% Run the test for a given number of iterations
for i = 1:iterations
    % Display the current iteration number
    i

    prefs = generatePreferences(num_agents, num_objects);

    [allocations] = iterate(prefs);

    utilities = calculateUtilities(prefs, allocations);

    % Store the utilities for each agent
    all_utilities = [all_utilities; utilities];
end

%% Create a bar plot of the average utility for each agent
bar(mean(all_utilities), 'BarWidth', 1)

% Add a title, x-axis label, and y-axis label to the plot
title('Average Utility by Agent Position');
xlabel('Agent Number');
ylabel('Average Utility');

toc
