clear
clc
close all
load task1.mat
load qeval.mat
% Set the user-decided parameters
discount_rate=0.9; % discount_rate 0-1
epsilon_type=2; % epsilon_type:1-5
total_time=0;
total_num=0;
%% Task1
% Set the running times
for run =1:10
    disp(['Run number: ',num2str(run)]);
    [time,graph_title,q_grid]=Q_Learning(reward,epsilon_type,discount_rate);
    % Actions selected by the optimal policy at each state
    action(:,run)=Action_Output(q_grid,graph_title,discount_rate);
    % Optimal path from the initial place to the target
    [reached,exe_time]=Optimal_Path(q_grid,graph_title,discount_rate,time);
    total_time=total_time+exe_time;
    total_num=total_num+reached;
end
    avarage_time=total_time/total_num;
    disp(['avarage time of successful cases ' num2str(avarage_time) ' sec']);
%% Task2
% Set the running times
for run =1:10
    disp(['Run number: ',num2str(run)]);
    [time,graph_title,q_grid]=Q_Learning(qevalreward,epsilon_type,discount_rate);
    % Actions selected by the optimal policy at each state
    action(:,run)=Action_Output(q_grid,graph_title,discount_rate);
    % Optimal path from the initial place to the target
    [reached,exe_time]=Optimal_Path(q_grid,graph_title,discount_rate,time);
    total_time=total_time+exe_time;
    total_num=total_num+reached;
end
    avarage_time=total_time/total_num;
    disp(['avarage time of successful cases ' num2str(avarage_time) ' sec']);

