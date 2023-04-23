function [graph_title,q_grid]=Q_Value_Iteration(reward_grid,q_grid,epsilon_type,dis_rate)

    cur_state=1;
    final_state=100;
    lr=1;
    threshold=0.005;
    time_step=1;
    while cur_state<final_state && lr > threshold && time_step<=3000
        % get learning rate and exploration probability
        [graph_title, lr, epsilon] = Epsilon_Iteration(epsilon_type,time_step);
        % select action
        sh_q_values = q_grid(cur_state,:);                     % q values of each action of current state
        prob = Exploration_Exploitation_Prob(sh_q_values,epsilon);   % probability of doing each action at current state
        action = randsample(4,1,true,prob);         % action to take
        % apply action
        switch action
            case 1
                new_state = cur_state - 1; 
            case 2
                new_state = cur_state + 10;
            case 3
                new_state = cur_state + 1;
            case 4
                new_state = cur_state - 10;
        end
        % receive reward
        r = reward_grid(cur_state,action);
        % Potential-based shaping function
        Potential= @(x) (1-(10-floor((x-1)/10)+10-(x-floor((x-1)/10)*10))/(10+10))*1000;
        %sh_func=0.9*Potential(new_state)-Potential(cur_state);
        sh_func=0;
        % Next state is substracted by current potential
        future_q = max(q_grid(new_state,:));
        % update shaped Q value grids using shaped reward function
        sh_q_values(1,action) = sh_q_values(1,action) + lr * (r + sh_func + dis_rate * future_q - sh_q_values(1,action) );
        q_grid(cur_state,:) = sh_q_values;
        cur_state=new_state;
        time_step=time_step+1;
    end

end

