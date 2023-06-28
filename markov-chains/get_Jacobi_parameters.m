function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
	% G -> iteration matrix
	% c -> iteration vector
	
	% m and n are the same
	dim = size(Link)(1);

	G = Link([1:dim - 2], [1:dim - 2]);
	c = Link([1:dim - 2], [dim - 1]);

endfunction
