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


list = [0.01 0.03 0.1 0.3 1 3 10 30];
Result.min_error = Inf;
Result.index_i = 0;
Result.index_j = 0;

for i = 1: length(list)
  for j = 1: length(list)
    model = svmTrain(X, y, list(i), @(x1, x2) gaussianKernel(x1, x2, list(j)));
    predictions = svmPredict(model, Xval);
    
    error = mean(double(predictions ~= yval));
    
    if (error < Result.min_error)
      Result.min_error = error;
      Result.index_i = i;
      Result.index_j = j;
    end
  end
end  


C = list(Result.index_i);
sigma = list(Result.index_j);

% =========================================================================

end
