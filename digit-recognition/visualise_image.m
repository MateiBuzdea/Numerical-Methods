## Copyright (C) 2021 Matei

function im = visualise_image (train_mat, number)
	% initialize the final matrix
	im = zeros(28, 28);

	% read from train_mat the line with the number 'number', which is a image
	% represented as an array
	im = train_mat(number, :);

	% reshape the image
	im = reshape(im, 28, 28)';
	
	% imshow(im)
endfunction
