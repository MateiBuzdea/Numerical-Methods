function [decoded_path] = decode_path (path_v, lines, cols)
	% path_v -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
	%                 corresponding to path states
	% hint: decoded_path does not contain indices for the WIN state

	decoded_path = [];

	% go through the cells
	for idx = 1:size(path_v)(2) - 1
		cell_id = path_v(idx);
		i = floor((cell_id - 1) / cols) + 1;
		j = mod(cell_id - 1, cols) + 1;
		decoded_path = [decoded_path; [i, j]];
	endfor

endfunction