function [J, grad] = cost_function(params, X, y, lambda, ...
									 input_layer_size, hidden_layer_size, ...
									 output_layer_size)

	% params -> vector containing the weights from the two matrices
	%           Theta1 and Theta2 in an unrolled form (as a column vector)
	% X -> the feature matrix containing the training examples
	% y -> a vector containing the labels (from 1 to 10) for each
	%      training example
	% lambda -> the regularization constant/parameter
	% [input|hidden|output]_layer_size -> the sizes of the three layers
	
	% J -> the cost function for the current parameters
	% grad -> a column vector with the same length as params
	% These will be used for optimization using fmincg
	
	"parse_weights";
	"sigmoid";
	"forward_propagation";
	
	[m, n] = size(X);
	
	% get Theta1 and Theta2 (from params)
	[Theta1, Theta2] = parse_weights(params, input_layer_size, hidden_layer_size,
									 output_layer_size);
	
	% Forward propagation
	[a1, a2, a3, z2, z3] = forward_propagation(X, Theta1, Theta2);
	
	% transform y array into a matrix of predictions
	y_pred = eye(rows(z3));
	y_pred = y_pred(:, y);
	
	% Compute the cost function, h(x_i) = a3(:, i)
	cost_i = -y_pred .* log(a3) - (1 - y_pred) .* log(1 .- a3);
	J = (1/m) * sum(cost_i(:));
	J += lambda/(m*2) * (sum((Theta1(:,2:end).^2)(:)) + sum((Theta2(:,2:end) .^2)(:)));
	
	Delta1 = zeros(size(Theta1));
	Delta2 = zeros(size(Theta2));
	% Compute the error in the output layer and perform backpropagation
	for i = 1:m
		% output layer error for test i
		dlt3 = a3(:, i) - y_pred(:, i);
		Delta2 = Delta2 + dlt3 * a2(:, i)';
		
		% hidden layer error for test i
		dlt2 = (Theta2' * dlt3) .* (a2(:, i) .* (1 .- a2(:, i)));
		
		% eliminate bias component
		dlt2 = dlt2(2:end);
	
		Delta1 = Delta1 + dlt2 * a1(:, i)';
	endfor
	
	% Determine the gradients
	grad1 = Delta1 ./ m 
	grad1(:,2:end) += Theta1(:,2:end) .* (lambda / m);
	grad2 = Delta2 ./ m
	grad2(:,2:end) += Theta2(:,2:end) .* (lambda / m);
	
	% Final J and grad
	grad = [grad1(:); grad2(:)];

endfunction
