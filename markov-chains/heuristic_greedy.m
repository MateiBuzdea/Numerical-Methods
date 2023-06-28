function [path_v] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path_v -> the states chosen by the algorithm
	
	% number of cells
	dim = size(Adj)(1) - 2;
	win_id = dim + 1;
	lose_id = dim + 2;
	path_v = start_position;
	visited = zeros(1, dim + 2);

	visited(start_position) = 1;

	while columns(path_v) != 0
		position = path_v(end);

		% get the neighbors of this position
		neighbors = Adj(position, :);

		% If WIN, return the path_v
		if position == win_id
			return;
		endif

		% Check if all nighbor cells of this position are visited
		% Also find the neighbor with the highest probability (if existent)
		no_unvisited_neighbors = 1;
		max_p = 0;
		max_neighbor = 0;
		for i = 1:dim + 2
			if neighbors(i) == 1 && visited(i) ~= 1
				no_unvisited_neighbors = 0;
				if probabilities(i) > max_p
					max_p = probabilities(i);
					max_neighbor = i;
				endif
			endif
		endfor

		if no_unvisited_neighbors == 1
			% pop the last element(position)
			path_v = path_v(1:end - 1);
		else
			% now go to the nearest cell with the highest probability
			neighbor = max_neighbor;
			visited(neighbor) = 1;
			path_v = [path_v, neighbor];
		endif
	endwhile

endfunction
