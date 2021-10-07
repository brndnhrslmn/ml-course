function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% set testing values for C and sigma
C_vals = sigma_vals = [0.01 0.03 0.1 0.3 1 3 10 30];
% set default error value
err_val = 100;

% for every value of C, test a value of sigma for 64 combinations
for C_test = C_vals
  for sigma_test = sigma_vals
    % iteratively train model with 1 of 64 C and sigma combinations
    model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
    err_test = mean(double(svmPredict(model, Xval) ~= yval));
    % check if value is decreasing and update final C, sigma and error values
    if err_test < err_val
      C = C_test;
      sigma = sigma_test;
      err_val = err_test;
    end
  end
end

fprintf('\nTest complete.\nBest value of C = %f and sigma = %f with a prediction error = %f\n\n', C, sigma, err_val);

% =========================================================================

end
