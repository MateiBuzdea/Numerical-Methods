function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
	% FeatureMatrix -> the matrix with all training examples
	% Y -> the vector with all actual values
	% n -> the number of predictors
	% m -> the number of trainings
	% alpha -> the learning rate
	% iter -> the number of iterations

	% Theta -> the vector of weights

	% Initial values are 0
	Theta = zeros(n, 1);

	for it = 1:iter
		% calculate h
		h = FeatureMatrix * Theta;

		% Calculate the gradient of J using the formula
		gradJ = [];
		for j = 1:n
			dJ = 0;

			for i = 1:m
				% Now find dJ
				dJ += (h(i) - Y(i)) * FeatureMatrix(i, j);
			endfor

			dJ = dJ / m;
			gradJ = [gradJ; dJ];
		endfor

		% Now that we have the gradient, build Theta
		Theta = Theta - alpha * gradJ;
	endfor

	% add the free term
	Theta = [0; Theta];

endfunction