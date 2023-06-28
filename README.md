# Numerical Methods

This repository is a collection of algorithms and scripts from different
homework in the Numerical Methods course.

## Algorithms

Note that some of these are code snippets and do not work as standalone
programs. The implemented algorithms are:

### Markov chains

* This algorithm calculates the best (shortest) path to exit from a labyrinth,
given the starting position and the win zones. It computes probabilities for
each position using Markov Chains and solves the system using an iterative G-c
method. It then applies heuristic greedy to find the path.

### Linear regression

* Gives a prediction based on a previously fed dataset. 

### Neural Network

* Creates a Neural Network and adjusts it based on the dataset (Mnist-101) given
for training. Then gives a prediction based on the input test image (tested
for digit recognition).

### SVD

* This algorithm takes as input an image and compresses it using SVD. The
compression takes place because the computed matrices are taken into account
only K < m/n components.

### PCA with SVD

* This algorithm computes the Principal Components using SVD. First, the dataset
is translated/moved with the center in the origin (that is why from each
vector is substracted the mean). Then the Z matrix is computed and SVD is
applied to it, thus resulting the PCA plane. After that, the dataset is
projected onto the PCA plane and then the first operation is reversed (the
center is moved back).

### PCA with covariance matrix

* This algorithm is very similar to the previous algorithm. The first and last
steps are the same. The difference is made by the covariance matrix and the
fact that eigenvectors are computed instead of singular vectors (because Z and
our matrix multiplied by its transpose are similar, so the eigenvalues and
singular vectors are related, both of them sending to the principal component
plane).

### Digit recognition

* Similar to the previous digit recognition algorithm that uses Neural Networks.
This one uses the PCA algorithm to "shrink" the information in an image and
then applies KNN to find the best match.


## Notes:
* A better explanation of PCA and SVD algorithms can be found here: [Relation
	Between SVD and PCA](https://intoli.com/blog/pca-and-svd/)