## Put comments here that give an overall description of what your
## functions do

## Will make and cache a matrix

makeCacheMatrix <- function (x=matrix()) {
  i<- NULL
  set <- function (y) {
    x <<- y
    i <<- NULL
  }
  get <- function ()x
  setinv <- function(inverse) i <<- inverse
  getinv <- function () i
  list (set = set, get = get, 
        setinv = setinv, 
        getinv = getinv)
}



## Will see if a new inversion is required, will use the cache if not

       
cacheSolve <- function (x, ...) {
  i <- x$getinv()
  if(!is.null(i)) {
    message ("getting cached data")
    return(i)
  }
  data <- x$get()
  i<-solve(data,...)
  x$setinv(i)
  return(i)
}
