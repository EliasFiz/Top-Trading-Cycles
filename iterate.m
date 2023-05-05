function [updated_preferences updated_allocations] = iterate(prefs, allocations)
   most_prefs = [];
   for index = 1:length(prefs)
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
           % Updated the line below to use the cycle_edges{k}(1) as the index and cycle_edges{k}(2) as the assigned value
           allocations(cycle_edges{k}(1)) = cycle_edges{k}(2);
       end
   end
   updated_preferences = prefs;
   updated_allocations = allocations;
end
