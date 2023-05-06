% Utility Distribution test (test to see if it maximises utility)

%% Misc
clc
clear

%% Set number of agents, objects, and iterations
num_agents = 100;
num_objects = 100;
iterations = 1;

all_utilities = [];

x = [1:iterations];

tic

% Loop through iterations
for i = 1:iterations
    i

    % Generate preferences
    prefs = generatePreferences(num_agents, num_objects);

    % Run TTC with true preferences
    [allocations] = iterate(prefs);

    % Calculate utilities
    utilities = calculateUtilities(prefs, allocations);

    all_utilities = [all_utilities utilities];
end

%% Create a histogram of utilities
h = histogram(all_utilities, 'BinWidth', 1, 'FaceColor', 'blue');

[counts, edges] = histcounts(all_utilities, 'BinWidth', 1);

bar(edges(1:end-1), counts);

% Add labels and title to the plot
xlabel('Utility');
ylabel('Frequency');
title('Bar Chart of Individual Utility Frequencies');

%% Calculate and display statistics for the utility distribution
max = max(all_utilities)
min = min(all_utilities)
mean = mean(all_utilities)
std = std(all_utilities)
iqr = iqr(all_utilities)
median = median(all_utilities)

toc
