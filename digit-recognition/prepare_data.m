## Copyright (C) 2021 Matei

function [train_mat, train_val] = prepare_data (name, no_train_images)
	n = 784;

	% initialize train_mat
	train_mat = zeros(no_train_images, n);

	%initialize train_val
	train_val = zeros(1, no_train_images);

	d = load(name);
	X = d.trainX;
	Y = d.trainY;

	% Save in the train_mat matrix the first no_train_images lines from
	% the training image table.
	train_mat = X(1:no_train_images, :);

	% Save the first no_train_images values ​​in the train_val vector
	% of the tag vector.
	train_val = Y(1:no_train_images);
endfunction
