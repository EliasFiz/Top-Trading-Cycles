function [updated_preferences updated_allocations] = iterate(prefs, allocations)
    most_prefs = [];

    % Replace 'length' with 'size(prefs, 1)' to get the number of agents
    for index = 1:size(prefs, 1)
        x = prefs(index, find(prefs(index, :) ~= -1, 1));

        if ~isempty(x)
            most_prefs = [most_prefs x];
        else
            most_prefs = [most_prefs -1];
        end

    end

    cycles = detectCycles(most_prefs);
    
    for i = 1:length(cycles)
        
        cycle_nodes = cycles{i}{1};
        cycle_edges = cycles{i}{2};

        for j = 1:length(cycle_nodes)
            prefs(cycle_nodes(j), :) = -1 * ones(1, size(prefs, 2));
            prefs(prefs == cycle_nodes(j)) = -1;
        end

        for k = 1:length(cycle_edges)
            allocations(cycle_edges{k}(1)) = cycle_edges{k}(2);
        end
    end
    updated_preferences = prefs;
    updated_allocations = allocations;
end
