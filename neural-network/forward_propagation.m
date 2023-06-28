function [a1, a2, a3, z2, z3] = forward_propagation (X, Theta1, Theta2)
	% X -> the test examples for which the classes must be predicted (matrix)
	% X = [example1; example2; ...; examplem]
	% Theta1, Theta2 -> weight matrices for the input and hidden layers
	% a1, a2, a3, z2, z3 -> matrices with the layer activations for all the sets
	
	"sigmoid";
	
	% for the first layer, add the bias column (ones)
	a1 = X';
	[m, n] = size(a1);
	bias = ones(1, n);
	a1 = [bias; a1];
	
	% calculate for the second layer
	z2 = Theta1 * a1;
	a2 = sigmoid(z2);
	[m, n] = size(a2);
	a2 = [bias; a2];
	
	% calculate for third layer
	% finally, a3 contains the predictions arrays for all tests
	z3 = Theta2 * a2;
	a3 = sigmoid(z3);

endfunction
