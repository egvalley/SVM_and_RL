clc;close all;clear all;
load('train.mat')
load('test.mat')

test_pred1=SVM_Linear(train_data,train_label,1000000,test_data);
Accuracy(test_label,test_pred1)
disp('==================================================');
disp('==================================================');
disp('==================================================');
test_pred2=SVM_Linear(train_data,train_label,1.1,test_data);
Accuracy(test_label,test_pred2)
disp('==================================================');
disp('==================================================');
disp('==================================================');
test_pred3=SVM_Polynomial(train_data,train_label,1000000,test_data,2);
Accuracy(test_label,test_pred3)
disp('==================================================');
disp('==================================================');
disp('==================================================');
test_pred4=SVM_Polynomial(train_data,train_label,0.6,test_data,2);
Accuracy(test_label,test_pred4)