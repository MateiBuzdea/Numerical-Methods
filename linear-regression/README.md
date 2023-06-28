## Linear-regression
* parse_data_set_file: The function reads the content of the file given as
  parameter and loads into memory the matrix corresponding to each test
  information
* prepare_for_regression: The function takes the previously saved matrix (which
  is a cell matrix, containing strings) and transforms it into a matrix of
  numbers, as specified in the document (furnished - 0,0; semi-furnished - 1,0;
  etc...)
* linear_regression_cost_function: Computes the average sum of errors squared,
  as specified in the document; the prediction is computed by directly
  multiplying the FeatureMatrix with the coefficients array (Theta); the actual
  value is then substracted from our prediction in order to calculate the
  average cost
* parse_csv_file: Similar to the first function; it uses csvread to firstly read
  the data in order to find the matrix dimensions, then uses textread to read
  and save the actual data
* gradient_descent: This function computes the partial derivatives of the cost
  function (using the formula in the documanet), thus forming the gradient and
  then performs iterations in order to correct the values of the Theta
  coefficients, thus improving the predictions
* normal_equation: Does the same as the previous function, but using the
  Conjugate Gradient Method, thus returning the reoriented (corrected) Theta
  vector
* lasso_regresion_cost_function: Comuptes Lasso regression using the given
  formula
* ridge_regression_cost_function: Comuptes Ridge regression using the given
  formula