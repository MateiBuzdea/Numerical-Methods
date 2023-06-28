function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
	%              be loaded_graphics_toolkits
	
	% Labyrinth -> the matrix of all encodings for the labyrinth's walls
	
	% first line contains matrix dimensions, just skip
	data = textread(file_path, "%d");
	m = data(1);
	n = data(2);
	Labyrinth = reshape(data(3:end), n, m)';

endfunction
