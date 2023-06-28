## Digit recognition
* The `prepare_photo`, `prepare_data` and `visualise_image` are helper
  functions.
* `magic_with_pca` applies the previous PCA algorithm on our dataset. As a
  result, the huge amount of data given for training is shrinked and from each
  image, only a fraction of the size is saved, corresponding to the principal
  components (in our case there are 23 principal components taken from an
  image with initial size of 784).
* The `KNN` function takes the image given for test and the previously
  optimised/shrinked test dataset and tries to find the vectors (components) in
  the dataset that are the closest to the given image. These results are sorted
  and the mean of the top 5 best predictions is taken as a final prediction that
  tells us which class the given test image is part of.
* The `classifyImage` function pieces together the last two functions in order
  to predict the number drawn in the image.