function [x, y] = calculateLorenzCurve(prefs, allocations)
    % Calculate utilities and cumulative sum of utilities
    utilities = calculateUtilities(prefs, allocations);

    sorted_utilities = sort(utilities);

    cumulative_utilities = cumsum(sorted_utilities);

    % Normalize cumulative utilities and calculate the normalized cumulative agent count
    normalized_cumulative_utilities = cumulative_utilities / sum(utilities);

    num_agents = length(utilities);
    normalized_cumulative_agent_count = linspace(0, 1, num_agents);

    x = normalized_cumulative_agent_count;
    y = [0, normalized_cumulative_utilities(1:end-1)];
end
