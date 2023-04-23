clear
clc
close all
%
%There are two parameters taken into considerations.
%As we all know, the shortest distance is the line linking two points. So,
%the distance between one position and the shortest line is important.
%Another parameter is just the distance between the goal and the current
%position. Adding two distances generates the intuitive rewards.
Q1=[0;0];
Q2=[10;10];

for i=1:10
    for j=1:10
        P=[j;i];
        % the reciprocal of the distance 1 is muliplied by coefficient
        dis1((i-1)*10+j) = 1/abs(det([Q2-Q1,P-Q1]))/norm(Q2-Q1)*1500; 
        % the reciprocal of the distance 2 is muliplied by coefficient
        dis2((i-1)*10+j)=1/pdist([j i; 10 10])*100;
    end
end

% Change the infinite number to a certain large number
for k=1:100
    if dis1(k)==Inf
        dis1(k)=20;
    end
    if dis2(k)==Inf
        dis2(k)=9999;
    end
end
% Adding two parameters
dis3=dis1+dis2;
% Generate the qevalreward by defining potential-based shaping function
load task1.mat
qevalreward=(reward==-1).*reward;
[m,n]=find(qevalreward==0);
gamma=0.9;
for i=1:length(m)
    switch n(i)
        case 1
            qevalreward(m(i),n(i))=dis3(m(i)-1);
        case 2
            qevalreward(m(i),n(i))=dis3(m(i)+10);
        case 3
            qevalreward(m(i),n(i))=dis3(m(i)+1);
        case 4
            qevalreward(m(i),n(i))=dis3(m(i)-10);
    end
end

