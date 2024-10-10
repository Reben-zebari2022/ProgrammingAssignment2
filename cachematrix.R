<<<<<<< HEAD
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
=======
makeCacheMatrix <- function(x = matrix()) {
  # Initialize the cache for the inverse
  inv <- NULL
  
  # Function to set the matrix value
  set <- function(y) {
    x <<- y
    inv <<- NULL  # Reset the inverse cache if matrix is changed
  }
  
  # Function to get the matrix value
  get <- function() x
  
  # Function to set the inverse of the matrix
  setinverse <- function(inverse) inv <<- inverse
  
  # Function to get the cached inverse
  getinverse <- function() inv
  
  # Return a list of the functions for setting and getting values
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}
cacheSolve <- function(x, ...) {
  # Retrieve the cached inverse, if it exists
  inv <- x$getinverse()
  
  # Check if the inverse is already cached
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)  # Return the cached inverse
  }
  
  # Otherwise, calculate the inverse
  data <- x$get()
  inv <- solve(data, ...)  # Compute the inverse
  
  # Cache the calculated inverse
  x$setinverse(inv)
  
  # Return the inverse
  inv
}
# Create a matrix and cache its inverse
mat <- matrix(c(1, 2, 3, 4), 2, 2)
cachedMatrix <- makeCacheMatrix(mat)

# Compute the inverse
cacheSolve(cachedMatrix)  # First computation

# Retrieve the cached inverse
cacheSolve(cachedMatrix)  # Should retrieve from cache
>>>>>>> c082d52 (Add cachematrix solution for matrix inversion caching)
