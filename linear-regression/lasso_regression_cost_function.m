function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
	% Theta -> the vector of weights
	% Y -> the vector with all actual values
	% FeatureMatrix -> the matrix with all training examples
	% lambda -> regularization parameter that controls the amount of 
	%           shrinkage applied to the regression coefficients

	% Error -> the error of the regularized cost function

	Error = 0;
	[m, n] = size(FeatureMatrix);

	% calculate h
	h = FeatureMatrix * Theta(2:end) + Theta(1);

	for i = 1:m
		Error += (h(i) - Y(i))^2;
	endfor

	% Calculate Theta's norm
	Theta_norm = norm(Theta, 1);

	Error = Error / m + lambda * Theta_norm;

endfunction