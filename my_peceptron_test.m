function test_err=my_peceptron_test(theta,b, X_test, y_test);
% test a perceptron classifier on given data, theta and bias.
% Input arguments:
% theta - the estimated parameters on the basis of the training examples
% b - a scalar that shifts the boundary plane
% X_test - a matrix with the test samples. Each row is a feature vector
% y_test - the labels of the test samples, 1 and -1
% Output arguments: test_err - the average error of the classifier
% Usage: test_err=my_peceptron_test(theta, b, X_test, y_test);
%

[m,d]=size(X_test);
y_pred=sign(X_test*theta+b);
test_err=1/m*sum(abs(sign(y_test-y_pred)));
end
