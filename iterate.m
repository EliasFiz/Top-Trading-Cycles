function [allocations, counter] = iterate(prefs, allocations)
    % Initialize counter which keeps track of the number of runs
    counter = 0;
    % Keep iterating while not all preferences are set to -1
    while ~all(prefs(:) == -1)
        most_prefs = [];
        % Iterate over the preference matrix
        for index = 1:length(prefs)
           % Get the first non-negative preference for each person
           x = prefs(index, find(prefs(index, :) ~= -1, 1));
           if ~isempty(x)
               most_prefs = [most_prefs x];
           else
               most_prefs = [most_prefs -1];
           end
        end

        % Detect cycles in the most preferred options
        cycles = detectCycles(most_prefs);

        % Iterate over the detected cycles
        for i = 1:length(cycles)
           cycle_nodes = cycles{i}{1};
           cycle_edges = cycles{i}{2};
           % Iterate over the nodes of the cycle
           for j = 1:length(cycle_nodes)
               % Set the preferences of the current node to -1
               prefs(cycle_nodes(j), :) = -1 * ones(1, size(prefs, 2));
               % Set the preferences of all nodes pointing to the current node to -1
               prefs(prefs == cycle_nodes(j)) = -1;
           end
           for k = 1:length(cycle_edges)
               allocations(cycle_edges{k}(1)) = cycle_edges{k}(2);
           end
        end
        counter = counter + 1;
    end

    allocations = allocations;
    counter = counter;
end
