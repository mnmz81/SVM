function [theta,theta0, k, gamma_geometric, R]=perceptron_train_2020(X,y,plotflag)
% [theta,k]=perceptron_train_2020(X,y);
% train a perceptron classifier on given data
% Input arguments:
%    X - a matrix with the training samples. Each row is a feature vector
%    y - the labels of the training samples, 1 and -1
%    plotflag - if 1, plot the feature vectors and the separation plane
%    Output arguments:
%    theta - the estimated parameters on the basis of the training examples
%    k - number of iterations
%    gamma_geometric - the smallest distance in the training space from any
%    example
%    R - a supremum of the norms of all the training examples ||xt||<=R
%
% Usage: [theta,k, gamma_geometric, R]=perceptron_train_2020(X,y,plotflag);

if nargin<3, plotflag=0; end
if nargin<2, [X,y]=gen_sep_lin_data(100); end

R=max(norm(X));
num_correct=0;
[m,n]=size(X); % m - number of points, n - feature space dimension
%% Initializations
theta0=0; % Initializing the bias
theta=zeros(n,1); % Initializing theta
k=0;
is_first_iter=1;
current_index=1;
R=max(max(X'));

%% Iterations
while (num_correct<m) % not all samples are classified correctly
    xt=X(current_index,:)'; % current input col vector
    yt=y(current_index);    % current label (1 or -1)
    a=sign(yt*(theta'*xt+theta0)); % checking if error is made
    
    if (is_first_iter==1 || a<0)
        num_correct=0;
        is_first_iter=0;
        
        theta=theta + (yt*xt);
        theta0=theta0+yt*R^2;
        % b=b+yt*R^2;
        k=k+1;      
        if plotflag==1; % plotting the samples and the decision boundary
        plot_points_and_boundary(X,y,theta,theta0)
        figure(1), 
        pause(0.001)
    end
        
    else
        num_correct=num_correct+1;
    end
    
    current_index=current_index+1;
    if (current_index>m), current_index=1; end  
        
end

%% obtaining gamma_geometric
thetanorm=theta/norm(theta);
gamma_geometric=min(abs((X*thetanorm)));

