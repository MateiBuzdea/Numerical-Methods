## Copyright (C) 2021 Matei

function prediction = classifyImage (im, train_mat, train_val, pcs)
	% Initialize prediction
	prediction = -1;

	im = im2double(im);

	# apply pca
	[train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
	train = im2double(train);

	% Substract miu to translate the image in the middle
	new_im = im - miu;

	% Change base to the PCA plane using Vk
	new_im = new_im * Vk;

	% Compute prediction using KNN
	prediction = KNN(train_val, Y, new_im, 5);

endfunction
