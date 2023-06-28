## Copyright (C) 2021 Matei

function sir = prepare_photo (im)
	% initialize final vector
	sir = zeros (1, 784);

	% invert the pixels of im
	im = 255 - im;

	% transform im into a line vector
	im = im';

	[m, n] = size(im);
	sir = reshape(im, 1, m * n);

endfunction
