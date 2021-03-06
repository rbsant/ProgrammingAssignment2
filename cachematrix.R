## these functions help to create and object matrix and to cache 
## its inverse.



## makecacheMatrix() creates an matrix obeject that can store/cache its inverse
## by using lexical scoping

makeCacheMatrix <- function(x = matrix()) {
 
    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
  
}


## cacheSolve() checks if the main matrix object generated by makeCaheMatrix()
## has it inverse already calculated. If not, it calculates its inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached inverse")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
} 
