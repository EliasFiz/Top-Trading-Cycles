function cycles = detectCycles(arr)
    n = length(arr);
    visited = false(1, n);
    cycles = {};

    for i = 1:n
        if ~visited(i) && arr(i) ~= -1
            cycle = [];
            current = i;

            while ~visited(current) && arr(current) ~= -1
                visited(current) = true;
                cycle = [cycle, current];
                current = arr(current);

                if current > n
                    break;
                end
            end

            % Check if there's a cycle and add it to the cycles list
            idx = find(cycle == current);
            if ~isempty(idx)
                unique_cycle = cycle(idx:end);
                if ~isContained(cycles, unique_cycle)
                    cycle_edges = edgesFromCycle(unique_cycle, arr);
                    cycles{end+1} = {unique_cycle, cycle_edges};
                end
            end
        end
    end
end

function result = isContained(cycles, cycle)
    for i = 1:length(cycles)
        stored_cycle = cycles{i}{1};
        if length(stored_cycle) == length(cycle) && all(sort(stored_cycle) == sort(cycle))
            result = true;
            return;
        end
    end
    result = false;
end

function edges = edgesFromCycle(cycle, arr)
    n = length(cycle);
    edges = cell(1, n);
    for i = 1:n
        from = cycle(i);
        to = arr(from);
        edges{i} = [from, to];
    end
end
