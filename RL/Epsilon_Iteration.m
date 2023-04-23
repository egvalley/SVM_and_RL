function [graph_title, a_rate, e_rate]  = Epsilon_Iteration(epsilon_type, k)

switch epsilon_type
    case 1
        epsilon = 1 / k;
        graph_title = 'Rate = ^{1}/_{k}'; 
    case 2
        epsilon = 100 / (100 + k);
        graph_title = 'Rate = ^{100}/_{100 + k}'; 
    case 3
        epsilon = (1 + log(k)) / k;
        graph_title = 'Rate = ^{1 + log(k)}/_{k}'; 
    case 4
        epsilon = (1 + 5 * log(k)) / k;
        graph_title = 'Rate = ^{1 + 5log(k)}/_{k}'; 
    case 5
        epsilon = exp(-0.001*k);
        graph_title = 'Rate = e^{-0.001k}'; 
    otherwise
        error('invalid rate decay type');
end

if epsilon > 1 || epsilon == inf || epsilon == -inf
    epsilon = 1;
end

a_rate = epsilon;
e_rate = epsilon;

end