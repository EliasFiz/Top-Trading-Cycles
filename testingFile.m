clc
clear
tic
num_iterations = 100;
num_agents = 20;
agent_avg = [];
for num = 1:num_agents
   loops = [];
   for iteration = 1:num_iterations
       prefs = generatePreferences(num, num);
      
       allocations = zeros(1, height(prefs));
      
       counter = 0;
       while ~all(prefs(:) == -1)
          
           [prefs allocations] = iterate(prefs, allocations);
           counter = counter + 1;
      
       end
      
       loops = [loops counter];
       [iteration num]
   end
  
   agent_avg = [agent_avg mean(loops)];
end
agent_avg
plot(1:num_agents, agent_avg);
% add labels and title to the plot
xlabel('number of agents');
ylabel('average swaps to reach convergence');
toc