function [manipulated_prefs, pos_manipulated] = manipulatePreferences(prefs)
    % Shuffle the preferences randomly of a randomly selected agent
    num_agents = size(prefs, 1);
    manipulated_prefs = prefs;
    pos_manipulated = randi(num_agents);

    manipulated_prefs(pos_manipulated, :) = prefs(pos_manipulated, randperm(size(prefs, 2)));

end
