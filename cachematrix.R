## author: gbuza
## Some of my comments are in the script, for testing and practicing.
## first of all delete the workspace
rm(list = ls())
rm(makeCacheMatrix) # or just the function

# makeCacheMatrix <- function(input_data, row, col) {
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  # set <- matrix(data = input_data, nrow = row, ncol = col) {
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
    get <- function() x
    setmatrix <- function(solve) m <<- NULL
    getmatrix <- function() m
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}
  
# Test Case, using the function.  
test <- rbind(c(3, 5),c(-7,2))
makeCacheMatrix(test)


## These part won't working. The function was compiled, but when i want to test i get an error message:
## Error in x$getmatrix : $ operator is invalid for atomic vectors

cacheSolve <- function(x, ...) {
    m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmatrix(m)
  m
}
# Test Case, using the function.  
test <- rbind(c(3, 5),c(-7,2))
makeCacheMatrix(test)
cacheSolve(test)

