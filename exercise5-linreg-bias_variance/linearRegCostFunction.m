function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% linear regression hypothesis function
yhat = (X * theta);

% exclude theta(0) by zeroing the 1st element of theta vector
theta1 = [0; theta(2:size(theta, 1))];

% calculate the regularization penalty
reg = (lambda * sum(theta1 .^ 2)) / (2 * m);
%reg = (lambda * (theta1' * theta1)) / (2 * m);

% calulate the cost with regularization
J = sum((yhat - y) .^ 2) / (2 * m) + reg;
%J = (yhat - y)' * (yhat - y) / (2 * m);

% update regularized gradient decent
grad = ((X' * (yhat - y)) + lambda * theta1) / m;

% =========================================================================

grad = grad(:);

end
