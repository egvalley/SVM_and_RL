function test_pred=SVM_Polynomial(train_data,train_label,C,test_data,p)

% Step1: sample standardization
train_mean = mean(train_data, 2);
train_std = std(train_data, 0, 2);
x_train = (train_data - train_mean) ./ train_std;
x_test = (test_data - train_mean) ./ train_std;
num_train = size(x_train, 2);
num_test = size(x_test, 2);
% Step2: linear kernel construction
kernel=@(x,y) (x*y+1).^p;
% Step3: Gram matrix construction
Gram=zeros(num_train, num_train);
for i=1:num_train
    for j=1:num_train
        Gram(i,j)=kernel(x_train(:,i)',x_train(:,j));
    end
end
% Step4: test the Mercer’s condition
eig_v=eig(Gram);
if min(eig_v) < -1e-4
    error("Don't satisfy Mercer's condition");
end
% Step5: quadprog() configuration
H_matrix=zeros(num_train, num_train);
for i=1:num_train
    for j=1:num_train
        H_matrix(i,j)=train_label(i)*train_label(j)*kernel(x_train(:,i)',x_train(:,j));
    end
end

f = -ones(1, num_train);
A = [];
b = [];
Aeq = train_label';
beq = 0;
lb = zeros(num_train, 1);
ub = ones(num_train, 1) * C;

alpha = quadprog(H_matrix, f, A, b, Aeq, beq, lb, ub);

% Step6: get the value of alpha
alpha=(alpha > 1e-4).*alpha;

% Step7: calculate the value of b0
SV_idx=find(alpha > 1e-4);
SV_num = size(SV_idx, 1);
SV_label = train_label(SV_idx);
bias_all = zeros(SV_num, 1);

% calculate the kernel values of support vectors
kernel_SV=zeros(num_train,SV_num);
for i=1:SV_num
    for j=1:num_train
        kernel_SV(j,i)=kernel(x_train(:,j)',x_train(:,SV_idx(i)));
    end   
end

% calculate the sum of weights*kernel values and the bias values
weights_x_SV=zeros(SV_num,1);
for i=1:SV_num
    weights_x_SV(i)=sum((alpha.*train_label).*kernel_SV(:,i));
    bias_all(i)=SV_label(i)-weights_x_SV(i);
end
bias = sum(bias_all) / SV_num;


% Step8: predictions based on the test dataset
kernel_data=zeros(num_train,num_test);
for i=1:num_test
    for j=1:num_train
        kernel_data(j,i)=kernel(x_train(:,j)',x_test(:,i));
    end
end

weights_x=zeros(num_test,1);
test_pred=zeros(num_test,1);
for i=1:num_test
    weights_x(i)=sum((alpha.*train_label).*kernel_data(:,i));
    gx=weights_x(i)+bias;
    test_pred(i)=sign(gx);
end

end