function prefs = generatePreferences(num_agents, num_objects)
    prefs = zeros(num_agents, num_objects);

    for i = 1:num_agents
        prefs(i, :) = randperm(num_objects);
    end
end
