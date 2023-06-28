function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
	% InitialMatrix -> the matrix that must be transformed

	% FeatureMatrix -> the matrix with all training examples
	
	FeatureMatrix = [];
	[m, n] = size(InitialMatrix);

	% parse each line
	for i = 1:m
		FeatureLine = [];

		for j = 1:n
			x = cell2mat(InitialMatrix(i, j));
			val = [];

			% check for the specified strings
			switch (x)
				case "furnished"
					val = [0, 0];
				case "unfurnished"
					val = [0, 1];
				case "semi-furnished"
					val = [1, 0];
				case "yes"
					val = [1];
				case "no"
					val = [0];
				otherwise
					val = str2double(x);
			endswitch

			FeatureLine = [FeatureLine, val];
		endfor

		FeatureMatrix = [FeatureMatrix; FeatureLine];
	endfor

endfunction