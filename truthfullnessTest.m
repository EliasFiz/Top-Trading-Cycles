% Compares true and manipulated utilities in TTC algorithm using a scatter plot

%% Misc
clc
clear

% Set the number of agents, objects, and iterations
num_agents = 100;
num_objects = 100;
iterations = 1000;

tic

true_utilities_arr = [];
manipulated_utilities_arr = [];

count = 0;

% Loop through iterations
for i = 1:iterations
    i

    % true preferences
    true_prefs = generatePreferences(num_agents, num_objects);

    [true_allocations, counter] = iterate(true_prefs);

    true_utilities = calculateUtilities(true_prefs, true_allocations);

    % Manipulate preferences
    [manipulated_prefs, pos_manipulated] = manipulatePreferences(true_prefs);

    manipulated_allocations = iterate(manipulated_prefs);

    manipulated_utilities = calculateUtilities(true_prefs, manipulated_allocations);

    % Check if the strategy is strategy-proof
    if manipulated_utilities(pos_manipulated) <= true_utilities(pos_manipulated)
        strategy_proof = 1;
    else
        strategy_proof = 0;
    end

    % Store true and manipulated utilities for the current iteration
    true_utilities_arr = [true_utilities_arr, true_utilities(pos_manipulated)];
    manipulated_utilities_arr = [manipulated_utilities_arr, manipulated_utilities(pos_manipulated)];

    % If the strategy is strategy-proof, increment the counter
    if strategy_proof == 1
        count = count + 1;
    end
end

% Display the number of strategy-proof outcomes (should equal number of iterations)
count

%% Create a scatter plot comparing true and manipulated utilities
scatter(true_utilities_arr, manipulated_utilities_arr, 'filled', 'SizeData', 20)
xlabel('True Utility');
ylabel('Manipulated Utility');
title('Utility by Truthfulness')

% Add a diagonal line to the plot to indicate where true utility equals manipulated utility
hold on;
x = linspace(0, 100, 100);
y = x;
plot(x, y, 'r', 'LineWidth', 1.5);

toc
