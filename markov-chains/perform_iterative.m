function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations

	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

	% x = Gx + c
	prev_x = x0;
	steps = 0;

	while 1
		x = G * prev_x + c;
		steps++;
		err = norm(x - prev_x);
		prev_x = x;

		if (steps == max_steps) || (err < tol)
			return;
		endif
	endwhile
	 
endfunction
