function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
	% Theta -> the vector of weights
	% Y -> the vector with all actual values
	% FeatureMatrix -> the matrix with all training examples

	% Error -> the error of the regularized cost function

	Error = 0;
	[m, n] = size(FeatureMatrix);
	
	% calculate h
	h = FeatureMatrix * Theta(2:end) + Theta(1);

	for i = 1:m
		Error += (h(i) - Y(i))^2;
	endfor

	Error = Error / (2 * m);

endfunction