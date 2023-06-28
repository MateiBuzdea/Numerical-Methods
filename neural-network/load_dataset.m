function [X, y] = load_dataset(path_v)
	% path_v -> a relative path to the .mat file that must be loaded
	% X, y -> the training examples (X) and their corresponding labels (y)
	
	load(path_v);

endfunction
