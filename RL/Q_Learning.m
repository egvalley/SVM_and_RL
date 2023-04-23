function [time,graph_title,q_grid]=Q_Learning(reward,epsilon_type,discount_rate)
    % RL variables
    threshold = 0.005;          % threshold for learning rate to stop trial and q-function difference to stop run 
    max_trials = 3000;          % number of trials per run 
    % Initialize reward grid and Q value grid
    reward_grid= reward;
    q_grid=(reward==-1).*reward;
    q_grid=q_grid*(999999);
    % Initialize the starting parameters
    trial = 1;
    converge = false;

    tic
    while trial <= max_trials && ~converge
        
        % Q-learning algorithm
        [graph_title,new_q_grid]=Q_Value_Iteration(reward_grid,q_grid,epsilon_type,discount_rate);
        % Trial number checking
        if trial==max_trials
            disp('Trial number overflows');
            time=toc;
        end
        % Converge checking
        for i = 1:100
                temp(i)= max(abs(new_q_grid(i,:) - q_grid(i,:)));
        end
        if max(temp)< threshold
            % Converge and record the time
            converge=true;
            disp('Converge');
            time=toc;
        end
        % Trial number +1 and update the Q values 
        trial = trial + 1;
        q_grid=new_q_grid;
    end
end
