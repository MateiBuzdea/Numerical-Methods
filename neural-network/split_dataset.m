function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
	% X -> the loaded dataset with all training examples
	% y -> the corresponding labels
	% percent -> fraction of training examples to be put in training dataset
	
	% X_[train|test] -> the datasets for training and test respectively
	% y_[train|test] -> the corresponding labels
	
	% Example: [X, y] has 1000 training examples with labels and percent = 0.85
	%           -> X_train will have 850 examples
	%           -> X_test will have the other 150 examples

	[m, n] = size(X);
	
	% create a permutation of size m (lines)
	perm = randperm(m);
	X_perm = X(perm,1:end);
	y_perm = y(perm,1);
	
	% split the set
	train_rows = floor(m * percent);
	X_train = X_perm(1:train_rows, 1:end);
	X_test = X_perm(train_rows+1:end, 1:end);
	y_train = y_perm(1:train_rows, 1);
	y_test = y_perm(train_rows+1:end, 1);

endfunction
