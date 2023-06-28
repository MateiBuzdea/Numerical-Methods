## Copyright (C) 2021 Matei

function new_X = task3 (photo, pcs)
	% PCA using covariant matrix

	[m, n] = size (photo);
	new_X = zeros (m, n);

	A = im2double(photo);

	% compute the average on each row (middle of the data)
	% this translates the origin of the coordinte system right at the middle
	u = sum(A, 2) ./ n;
	A = A - u;

	% Compute the covariance matrix
	Z = A * A' / (n - 1);

	% Compute eigenvalues
	[V, S] = eig(Z);

	% Sort eigenvalues and eigenvectors
	[sorted_eigvals, perm] = sort(diag(S), "descend");
	V = V(:, perm);

	% Keep the first columns only
	% OBS: the first columns of V represent the main components and
	% by keeping only the most important ones we thus obtain a good compression
	% of data. As we increase the number of main components, the clarity
	% of the image increases, but from one number on, the difference cannot be
	% noticed with the human eye so they can be eliminated.
	W = V(:, 1:pcs);

	% compute the Y matrix
	Y = W' * A;

	% Perform the approximation of the initial matrix and add the mean
	% (translate back the whole dataset to the old origin)
	Ak = W * Y + u;

	new_X = uint8(255 * Ak);
endfunction