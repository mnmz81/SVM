function [distance] = gammaGeom(X,theta)
%LAMDAGEOM Summary of this function goes here
%   Detailed explanation goes here
m=-theta(1)/theta(2);
n=size(X,1);
distance=inf;
for i=1:n
    dist=abs( -m*X(i,1)+ X(i,2) )/sqrt(m^2+1);
    if dist<distance
        distance=dist;
    end
end
end

