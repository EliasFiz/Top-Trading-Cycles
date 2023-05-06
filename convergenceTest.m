% Calculates the average number of swaps required for TTC to reach convergence based on the number of agents

%% Misc
clc
clear


%% Set the number of iterations and agents for test
num_iterations = 500;

num_agents = 100;

agent_avg = [];

tic

% Loop through agents
for num = 1:num_agents
    loops = [];

    % Run the test for a given number of iterations
    for iteration = 1:num_iterations
        prefs = generatePreferences(num, num);

        % Initialize an empty allocations array
        allocations = zeros(1, height(prefs));

        % Run the TTC algorithm to get allocations and the counter of swaps
        [allocations, counter] = iterate(prefs, allocations);

        % Store the number of swaps in the loops array
        loops = [loops, counter];

        [iteration, num]
    end

    % Calculate the average number of swaps for the current agent and store it in agent_avg array
    agent_avg = [agent_avg, mean(loops)];
end

%% Plot the average number of swaps for each agent
plot(1:num_agents, agent_avg);

xlabel('number of agents');
ylabel('average swaps to reach convergence');

toc
