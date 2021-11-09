function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0;
sigma = 0;
CList = [0.01;0.03;0.1;0.3;1;3;10;30];
sigmaList = [0.01;0.03;0.1;0.3;1;3;10;30];

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
row = 1;
results = zeros(64,3);
l=length(CList);
for i = 1:length(CList)
  
for j = 1:length(sigmaList)
  
  model= svmTrain(X, y, CList(i), @(x1, x2) gaussianKernel(x1, x2, sigmaList(j))); 
  
  predictions = svmPredict(model, Xval);
  
  err_val = mean(double(predictions ~= yval
  ));
  
  results(row,:) = [CList(i) sigmaList(j) err_val];
  row = row+1;
  [err_val CList(i) sigmaList(j)]
end

end

[min_err_val index]=min(results(:,3))

ind =results(index,:)
C = results(index,1)
 
sigma = results(index,2)

C
sigma



% =========================================================================

end
