## Copyright (C) 2023 Matei

function new_X = task1 (photo, k)
	%  SVD algorithm

	[m, n] = size (photo);

	A = im2double(photo);

	% perform SVD and remove additional zeros lines/cols in K matrix
	[U, S, V] = svd(A, "econ");

	% take the first k singular values only
	Uk = U(:, 1:k);
	Sk = S(1:k, 1:k);
	Vk = V(:, 1:k);

	% compute the reduced matrix, Ak
	new_X = Uk * Sk * Vk';

	% transform to uint8
	new_X = uint8(255 * new_X);

endfunction