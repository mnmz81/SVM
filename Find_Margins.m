function [line1,line2] = Find_Margins(X,labels,theta,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
xx=min(X(:,1))-10:0.5:max(X(:,2));
group1=X(labels>0,:);
group2=X(labels<0,:);
A=theta(1)/theta(2);
dist=abs(A*group1(:,1) +group1(:,2))/sqrt(A^2+1);
[val,I]=min(dist);
p=group1(I,:);
line1=-theta(1)/theta(2)*(xx-p(1))+p(2);
dist=abs(A*group2(:,1) +group2(:,2))/sqrt(A^2+1);
[val,I]=min(dist);
p=group2(I,:);
line2=-theta(1)/theta(2)*(xx-p(1))+p(2);
end

