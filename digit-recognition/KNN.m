## Copyright (C) 2021 Matei

function prediction = KNN (labels, Y, test, k)
	% initialize prediction
	prediction = -1;

	% initialize distances
	[m, n] = size (Y);
	distance = zeros (m, 1);

	% For each row in Y, compute the Euclidean distance between it and
	% the test vector
	for i = 1:m
		dist = norm(Y(i, :) - test);
		distance(i) = dist;
	endfor

	% Sort the distances in ascending order and also remember the first k labels
	[~, perm] = sort(distance);
	first_labels = labels(perm)(1:k);

	% Compute the prediction as the median of the first k values
	prediction = median(first_labels);

endfunction
