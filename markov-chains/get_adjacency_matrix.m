function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

	% Adj -> the adjacency matrix associated to the given labyrinth

	[m, n] = size(Labyrinth);
	matrix_size = m * n + 2;
	win_id = matrix_size - 1;
	lose_id = matrix_size;

	% Here declare the sparse matrix lines and columns indices arrays
	x = [];
	y = [];

	% If in win/lose position, stay in win/lose
	x = [x, win_id, lose_id];
	y = [y, win_id, lose_id];

	for i = 1:m
		for j = 1:n
			% calculate the cell id
			c_id = n * (i - 1) + j;

			% Here we must see if the current cell is connected with the others
			% at north south east and west
			% Get the bits from bit 4 to bit 1
			walls = bitget(Labyrinth(i, j), 4:-1:1);

			% now update the adjacency matrix_type
			if walls(1) == 0 % North
				neighbor = c_id - n;
				if i == 1 % adjacent with Win
					neighbor = win_id;
				endif
				x = [x, c_id];
				y = [y, neighbor];
			endif

			if walls(2) == 0 % South
				neighbor = c_id + n;
				if i == m % adjacent with Win
					neighbor = win_id;
				endif
				x = [x, c_id];
				y = [y, neighbor];
			endif

			if walls(3) == 0 % East
				neighbor = c_id + 1;
				if j == n % adjacent with Lose
					neighbor = lose_id;
				endif
				x = [x, c_id];
				y = [y, neighbor];
			endif

			if walls(4) == 0 % West
				neighbor = c_id - 1;
				if j == 1 % adjacent with Lose
					neighbor = lose_id;
				endif
				x = [x, c_id];
				y = [y, neighbor];
			endif
		endfor
	endfor

	% Now create the sparse matrix
	Adj = sparse(x, y, 1, matrix_size, matrix_size);
	
endfunction
