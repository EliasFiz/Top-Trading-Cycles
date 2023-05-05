clc
clear
tic
num_iterations = 500;
num_agents = 10;
agent_avg = [];
for num = 1:num_agents
   loops = [];
   for iteration = 1:num_iterations
       prefs = generatePreferences(num, num);      
       allocations = zeros(1, height(prefs));

       [allocations counter] = iterate(prefs, allocations);
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