## Copyright (C) 2023 Matei

function new_X = task2 (photo, pcs)
	% PCA computing using SVD

	[m n] = size(photo);
	new_X = zeros(m, n);

	A = im2double(photo);

	% compute the average on each row (middle of the data)
	% this translates the origin of the coordinte system right at the middle
	miu = sum(A, 2) ./ n;
	A = A - miu;

	% create Z matrix
	Z = A' / sqrt(n - 1);

	% compute SVD for Z
	[U, S, V] = svd(Z);

	% compute W from V and the Y matrix
	W = V(:, 1: pcs);
	Y = W' * A;

	% Perform the approximation of the initial matrix and add the mean
	% (translate back the whole dataset to the old origin)
	Ak = W * Y + miu;

	new_X = uint8(255 * Ak);
endfunction