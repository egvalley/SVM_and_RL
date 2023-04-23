function [reached,exe_time]=Optimal_Path(q_grid,graph_title,dis_rate,time)
reached=0;
exe_time=0;
% Initialize the ij coordinate
figure;
axis ij;xlim([0,10]);ylim([0,10]);grid on;hold on;
title({['\gamma = ', num2str(dis_rate)];graph_title});
set(gca,'YDir','reverse');

% Finding the path from the starting place
state=1;
final_state=100;
overflow_sign=1; % if the goal could not be reached, raise the overflowing sign
while state~=final_state && overflow_sign<150
    % The coordinates of the current state 
    x_axis=floor((state-1)/10)+0.5;
    y_axis=state-floor((state-1)/10)*10-0.5;
    % The optimal action taken in this sate
    [~,action]=max(q_grid(state,:));
    switch action
    case 1
        plot(x_axis,y_axis,'^','Color','red');
        hold on;
        state=state-1;
    case 2
        plot(x_axis,y_axis,'>','Color','red');
        hold on;
        state=state+10;
    case 3
        plot(x_axis,y_axis,'v','Color','red');
        hold on;
        state=state+1;
    case 4
        plot(x_axis,y_axis,'<','Color','red');
        hold on;
        state=state-10;
    end
    if state==100
        reached=1;
        exe_time=time;
    end
    overflow_sign=overflow_sign+1;% Counting
end
end