function plot_points_and_boundary(X,y,theta,b)
% plot_points_and_classifier(X,y,theta)
% plot_points_and_classifier plots data and decision boundary.
% points with y=+1  are plotted as red dots, while points with y=-1  
% are plotted as blue 'x's. 
% The decision boundary is plotted as a black line.
% Input arguments:
%    X -   a matrix of n x 2 
%    y -  a column vector of n x 1
%    theta -  a column vector of 2 x 1 
%    b - bias
% Usage: plot_points_and_boundary(X,y,theta)
    
    if nargin<=3, b=0; end

    plot(X(y==1,1), X(y==1,2),'ro');
    hold on;
    plot(X(y==-1,1), X(y==-1,2),'bx');
    v = axis;
    xmin = v(1);
    xmax = v(2);
    ymin = -(xmin*theta(1)+b)/theta(2);
    ymax2 = -(xmax*theta(1)+b)/theta(2);
    plot([xmin, xmax], [ymin, ymax2],'g','Linewidth',2);
    axis('tight')
    grid
    hold off;

