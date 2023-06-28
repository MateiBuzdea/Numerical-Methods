## Mnist-101
* load_dataset: Loads a matlab dataset file
* split_dataset: Takes the training examples and their labels from the previous
  function and splits them in two using the random function, thus creating two
  sets: one for training and one for test
* initialize_weights: creates a matrix with numbers between the two values given
  by the formula in the document (epsilon0) to avoid the Vanishing Gradient
  Problem
* parse weights (helper function): This functions takes as input the vactor
  consisting of the two layer matrices (Theta1 and Theta2) one after anuther and
  returns them in matrix form
* forward_propagation (helper function): This function takes in a test set (X)
  and the two matrices of the input and hidden layer and gives the predictions
  array using forward propagation; note that the X parameter can be a vector
  corresponding to the activations for the first layer just for one test, thus
  returning one prediction (10x1 vector), or can be a matrix, each column
  representing the test data, thus returning a matrix of predictions where each
  column contains the predictions for the corresponding test. I implemented this
  in order to compute values faster and for easier and cleaner understanding of
  the code
* cost_function: This function computes the cost function using the ormula in
  the document; then performs forward propagation on the training examples in
  order to getthe predictions; using these predictions, it then performs back
  propagation and computes the gradients for each layer, which will then be
  useful to update the weights for better predictions
* predict_classes: This functions uses the `forward_propagation` helper
  function, returns the predictions matrix and then takes the largest value of
  each column, thus returning the corresponding class numbers in the form of a
  vector