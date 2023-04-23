clear
clc
close all
figure;
for epsilon_type=1:5
k=1:1:200;
    for i=1:200
    [graph_title, a_rate, e_rate(i)]  = Epsilon_Iteration(epsilon_type, i);
    end
plot(k,e_rate);
hold on;
end
axis([0 200 0 1.1]);
title('ε,α values')
legend('Rate = ^{1}/_{k}','Rate = ^{100}/_{100 + k}','Rate = ^{1 + log(k)}/_{k}','Rate = ^{1 + 5log(k)}/_{k}','Rate = e^{-0.001k}');