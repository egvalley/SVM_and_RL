function action=Action_Output(q_grid,graph_title,dis_rate)
% Initialize the ij coordinate
figure;
axis ij;xlim([0,10]);ylim([0,10]);grid on;hold on;
title({['\gamma = ', num2str(dis_rate)];graph_title});
set(gca,'YDir','reverse');
% Plot the optimal policy at each state
for i=1:size(q_grid,1)-1
    % The coordinates of the current state 
    x_axis=floor((i-1)/10)+0.5;
    y_axis=i-floor((i-1)/10)*10-0.5;
    % The optimal action taken in this sate
    [~,action(i)]=max(q_grid(i,:));
    switch action(i)
    case 1
        plot(x_axis,y_axis,'^','Color','red');
        hold on;
    case 2
        plot(x_axis,y_axis,'>','Color','red');
        hold on;
    case 3
        plot(x_axis,y_axis,'v','Color','red');
        hold on;
    case 4
        plot(x_axis,y_axis,'<','Color','red');
        hold on;
    end
end

end