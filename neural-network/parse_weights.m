function [Theta1, Theta2] = parse_weights(params, input_layer_size, ...
									hidden_layer_size, output_layer_size)
	% This function returns the weight matrices from the array
	% params = [Theta1; Theta2]

	Theta1_arr = params(1 : (input_layer_size + 1) * hidden_layer_size);
	Theta2_arr = params((input_layer_size + 1) * hidden_layer_size + 1 :end);
	Theta1 = reshape(Theta1_arr, hidden_layer_size, input_layer_size + 1);
	Theta2 =  reshape(Theta2_arr, output_layer_size, hidden_layer_size + 1);

endfunction
