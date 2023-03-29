clc;close all;clear all;
load('train.mat')
load('test.mat')
% For assessment
% load('eval.mat') 

%% SVM with the Guassian kernel
test_pred1=SVM_Guassian(train_data,train_label,50,test_data,0.1);
Accuracy(test_label,test_pred1)
disp('=============================')
train_pred1=SVM_Guassian(train_data,train_label,50,train_data,0.1);
Accuracy(train_label,train_pred1)
disp('=============================')
% For assessment
%eval_predicted1=SVM_Guassian(train_data,train_label,50,eval_data,0.1); 
%% SVM with the Polynomial kernel
test_pred2=SVM_Polynomial(train_data,train_label,0.1,test_data,1);
Accuracy(test_label,test_pred2)
disp('=============================')
train_pred2=SVM_Polynomial(train_data,train_label,0.1,train_data,1);
Accuracy(train_label,train_pred2)
disp('=============================')
% For assessment
%eval_predicted2=SVM_Polynomial(train_data,train_label,0.1,eval_data,1); 
%% SVM with the Linear kernel
test_pred3=SVM_Linear(train_data,train_label,1000000,test_data);
Accuracy(test_label,test_pred3)
disp('=============================')
train_pred3=SVM_Linear(train_data,train_label,1000000,train_data);
Accuracy(train_label,train_pred3)
disp('=============================')
% For assessment
%eval_predicted3=SVM_Linear(train_data,train_label,1000000,eval_data); 
