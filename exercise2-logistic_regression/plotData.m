function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% find all rows with y = 1
adm = find(y==1);
% find all rows with y = 0
nonAdm = find(y==0);

% scatter plot exam results with y = 1 values
plot(X(adm, 1), X(adm, 2), 'k+', 'markersize', 7);
% scatter plot exam results with y = 1 values
plot(X(nonAdm, 1), X(nonAdm, 2), 'ko', 'markerfacecolor', 'y', 'markersize', 5);


% =========================================================================



hold off;

end
