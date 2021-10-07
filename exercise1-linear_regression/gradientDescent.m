function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    %x0 = 1;
    %x1 = X(:, 2); # select 2nd column of X as 1st column = ones
    %yhat = theta(1) + theta(2) * x ; # calculate hypothesis of theta for x
    %theta0 = theta(1) - alpha * (1 / m) * sum((yhat - y) .* x0); # update theta0
    %theta1 = theta(2) - alpha * (1 / m) * sum((yhat - y) .* x1); # update theta1
    %theta = [theta0; theta1]; # for historic theta storage
    
    yhat = X * theta;
    err = yhat - y;
    %theta = theta - ((alpha / m) * (X' * (yhat - y)));
    theta = theta - ((alpha / m) * (X' * (err)));

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
