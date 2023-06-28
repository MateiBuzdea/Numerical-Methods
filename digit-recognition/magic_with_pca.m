## Copyright (C) 2021 Matei

function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
	[m, n] = size (train_mat);

	% initialize train, miu, Y, Vk
	train = zeros (m, n);
	miu = zeros (1, n);
	Y = zeros (m, pcs);
	Vk = zeros (n, pcs);

	train_mat = im2double(train_mat);

	% apply PCA (snippet from task3 - PCA algorithm)
	A = train_mat;
	miu = sum(A, 1) ./ m;
	A = A - miu;

	% Compute the covariance matrix
	Z = A' * A / (m - 1);

	% Compute and sort eigenvalues and eigenvectors
	[V, S] = eig(Z);
	[sorted_eigvals, perm] = sort(abs(diag(S)), "descend");
	V = V(:, perm);

	% Keep the first columns only
	Vk = V(:, 1:pcs);

	% compute the Y matrix and the reduced A
	Y = A * Vk;

	train = Y * Vk';
	train = uint8(255 * train);

endfunction
