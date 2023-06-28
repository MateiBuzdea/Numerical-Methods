function [Y, InitialMatrix] = parse_csv_file(file_path)
	% path -> a relative path to the .csv file
	
	% Y -> the vector with all actual values
	% InitialMatrix -> the matrix that must be transformed

	% csvread DOES NOT read strings, so will use textread
	% just read with csvread in order to find the dimensions
	temp = csvread(file_path);
	[m, n] = size(temp);

	% remove header line
	m = m - 1;

	% read file (will be saved in a cell array)
	data = textread(file_path, "%s", 'delimiter', ',');
	data = data(n:end);

	% resize data (to get a matrix)
	data = reshape(data(2:end), n, m);
	data = data';

	InitialMatrix = data(:, 2:end);
	Y = [];
	for i = 1:m
		Y = [Y; str2double(cell2mat(data(i, 1)))];
	endfor

endfunction