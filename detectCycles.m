function cycles = detectCycles(arr)
   % Get the length of arr, and initialise visited and output cycles arrays
   n = length(arr);

   visited = false(1, n);
   
   cycles = {};

   % Iterate through each element in the input array
   for i = 1:n
       % If the current element has not been visited and its value is not -1
       if ~visited(i) && arr(i) ~= -1
           cycle = [];
           current = i;
           % Keep traversing the array until the current index has not been visited and its value is not -1
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

% This function checks if a given cycle is already contained in the cycles array
function result = isContained(cycles, cycle)
   for i = 1:length(cycles)
       stored_cycle = cycles{i}{1};
       % Check if the current stored cycle has the same length and elements as the input cycle
       if length(stored_cycle) == length(cycle) && all(sort(stored_cycle) == sort(cycle))
           result = true;
           return;
       end
   end
   result = false;
end

% This function returns the edges of a given cycle using the input array
function edges = edgesFromCycle(cycle, arr)
   n = length(cycle);
   edges = cell(1, n);
   for i = 1:n
       from = cycle(i);
       to = arr(from);
       edges{i} = [from, to];
   end
end
