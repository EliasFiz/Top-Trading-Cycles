function utilities = calculateUtilities(prefs, allocations)
    num_agents = size(prefs, 1);
    utilities = zeros(1, num_agents);
    % For each agent find the position of the allocated object in the agent's preference list
    for i = 1:num_agents
        rank = find(prefs(i, :) == allocations(i));
        % Calculate utility based on ranking system
        utilities(i) = size(prefs, 2) - rank + 1;
    end
end