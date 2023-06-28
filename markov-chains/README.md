## Markov-is-coming
* parse_labyrinth: The function read the content of the path given as parameter
  and loads into memory the matrix from the file
* get_adjacency_matrix: This function iterates over each cell in the Labyrinth
  (the data previously loaded), decodes it into a sequence of 4 binary digits
  and decides where the walls are located based on the corresponding digits; if
  between two cells there is no wall, the corresponding adjacency matrix cell
  will be 1, meaning the two cells are connected
* get_link_matrix: The same as the above function, but instead of 1, it will
  place 1/'the number of neighbouring cells' in the cells that specify
  connections between positions
  (the adjacency and link matrices are sparse, created with the use of three
  arrays: one for the lines-current cell, one for columns-neighbor cell and one
  for values-1 or probability)
* get_Jacobi_parameters: This function returns the G and c matrices that will be
  used to calculate the probabilities array using the Jacobi algorithm
* perform_iterative: Simply applies the Jacobi algorithm, with a maximum error
  of `tol` and a maximum number of `max_steps` steps and returns the
  probabilities array
* heuristic_greedy: Now that we know the win probability of each position in the
  Labirinth, we apply the heuristic_greedy algorithm that will give us the best
  path to win by taking each position and calculating the next one by searching
  the neighbor with the highest probability of win
* decode_path: Takes the previously computed path as an argument (containing
  cell ids) and returns the line and column of each cell