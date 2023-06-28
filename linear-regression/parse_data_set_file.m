function [Y, InitialMatrix] = parse_data_set_file(file_path)
	% path -> a relative path to the .txt file

	% Y -> the vector with all actual values
	% InitialMatrix -> the matrix that must be transformed
	
	% read file (will be saved in a cell array)
	data = textread(file_path, "%s");

	% save dimensions
	dim = cell2mat(data(1:2));
	m = str2double(dim(1, :));
	n = str2double(dim(2, :));

	% resize data (to get a matrix)
	data = reshape(data(3:end), n + 1, m);
	data = data';

	InitialMatrix = data(:, 2:end);
	Y = [];
	for i = 1:m
		Y = [Y; str2double(cell2mat(data(i, 1)))];
	endfor

endfunction