function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
	% FeatureMatrix -> the matrix with all training examples
	% Y -> the vector with all actual values
	% tol -> the learning rate
	% iter -> the number of iterations
	% tol -> the tolerance level for convergence of the conjugate gradient method

	% Theta -> the vector of weights
	
	[m, n] = size(FeatureMatrix);
	Theta = zeros(n, 1);

	% from the given formula
	A = FeatureMatrix' * FeatureMatrix;
	b = FeatureMatrix' * Y;

	% check if A is positive definite
	if (!all(eig(A) > 0))
		Theta = [0; Theta];
		return;
	endif

	r = b - A * Theta;
	prev_r = r;
	v = r;
	k = 1;
	while k < iter && prev_r' * prev_r > tol^2
		t = (prev_r' * prev_r)/(v' * A * v);
		Theta = Theta + t*v;
		r = prev_r - t * A * v;
		s = (r' * r)/(prev_r' * prev_r);
		v = r + s*v;
		k++;
		prev_r = r;
	endwhile

	% add the first element
	Theta = [0; Theta];

endfunction