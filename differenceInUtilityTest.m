% Creates a scatter plot comparing the utilities of agents when using true - manipulated preferences

%% Misc
clc
clear

%% Set number of agents, objects, and iterations
num_agents = 250;
num_objects = 250;
iterations = 10;

tic

x = [1:iterations];

all_util_diff = [];

%% Loop through the agents
for i = 1:num_agents
    i

    % Initialize an empty array to store utility differences for each iteration
    util_diff = [];

    % Run the test for a given number of iterations
    for j = 1:iterations
        true_prefs = generatePreferences(i, i);

        [true_allocations, counter] = iterate(true_prefs);

        true_utilities = calculateUtilities(true_prefs, true_allocations);

        [manipulated_prefs, pos_manipulated] = manipulatePreferences(true_prefs);

        manipulated_allocations = iterate(manipulated_prefs);

        manipulated_utilities = calculateUtilities(true_prefs, manipulated_allocations);

        % Check if the agent's manipulated utility is less than or equal to the true utility
        if manipulated_utilities(pos_manipulated) <= true_utilities(pos_manipulated)
            strategy_proof = 1;
        else
            strategy_proof = 0;
        end

        result = 1;

        % Calculate the difference between true and manipulated utilities and store it in util_diff array
        util_diff = [util_diff, true_utilities(pos_manipulated) - manipulated_utilities(pos_manipulated)];
    end

    % Store the minimum utility difference for the current agent in the all_util_diff array
    all_util_diff = [all_util_diff, min(util_diff)];
end

%% Create a scatter plot of utility differences for each agent
scatter(1:num_agents, all_util_diff, 'filled', 'SizeData', 20)
hold on;

% Add a reference line at y = 0 to the plot
line([1, num_agents], [0, 0], 'Color', 'k', 'LineWidth', 0.5)

xlabel('Number of Agents');
ylabel('True Utility - Manipulated Utility');
title('Utility by Truthfulness')

toc
