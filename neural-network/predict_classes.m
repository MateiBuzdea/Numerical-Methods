function [classes] = predict_classes(X, weights, ...
									input_layer_size, hidden_layer_size, ...
									output_layer_size)
	% X -> the test examples for which the classes must be predicted
	% weights -> the trained weights (after optimization)
	% [input|hidden|output]_layer_size -> the sizes of the three layers
	
	% classes -> a vector with labels from 1 to 10 corresponding to
	%            the test examples given as parameter
	
	"parse_weights";
	"sigmoid";
	"forward_propagation";
	
	% get Theta1 and Theta2 from weights array
	[Theta1, Theta2] = parse_weights(weights, input_layer_size, hidden_layer_size,
									 output_layer_size);
									 
	% perform forward propagation
	[a1, a2, a3, z2, z3] = forward_propagation(X, Theta1, Theta2);
	
	% get the class from the matrix by saving the prediction with the max value
	[max_predictions, indices] = max(a3);
	classes = indices';
	
endfunction
