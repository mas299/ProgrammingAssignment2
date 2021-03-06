## The following two functions are used together to cache and return the values of an 
## inverse matrix 

## makeCacheMatrix defines a set of functions used to cache values of an inverse matrix
## that will be used by the cacheSolve function 

## Assigns makeCacheMatrix as a function with the argument 'x' (x will be the matrix dataset)
makeCacheMatrix <- function(x = matrix()) {
  
    ## Set matinv to null -- matinv is the varaible used to cache the inverse matrix
    matinv <- NULL

    ## Assign the set function which creates the cached variable x in this function's 
    ## environment and assignes matinv (matrix inverse) to null
    set <- function(y) {
        x <<- y
        matinv <<- NULL
    }
    
    ## Assign the get function that returns x (the data passed into makeCacheMatrix)
    ## when called
    get <- function() x
    
    ## Assign the setmatrix function.  setmatrix assigns the matinv variable value when called 
    setmatrix <- function(inv) matinv <<- inv
    
    ## Assign the getmatrix function.  getmatrix will return the value of matinv (the inverse
    ## matrix)  
    getmatrix <- function() matinv
    
    ## Creates a list containing the 4 functions defined in makeCacheMatrix  
    list(set = set, get = get,
        setmatrix = setmatrix,
        getmatrix = getmatrix)
}

## The following function looks for a current inverted matrix value and, if it is null, 
## calculates using the functions and data defined in makeCacheMatrix

## Initiate cacheSolve to return an inverse matrix using makeCacheMatrix
cacheSolve <- function(x, ...) {

    ## Assigns matinv the current value of matinv using the getmatrix function
    matinv <- x$getmatrix()
    
    ## If statement  evaluates whether matinv is null at this point
    if(!is.null(matinv)) {
        
        ## If matinv is null, print the message, return the value of matinv and stop
        message("getting cached data")
        return(matinv)
    }
    
    ## Calls/loads the dataset using the get function into the current environment  
    data <- x$get()
    
    ## Invert the matrix (stored in data) using the solve function and assign it to matinv
    matinv <- solve(data, ...)
    
    ## Use the setmatrix function to assign the current value of matinv to the envrionment
    x$setmatrix(matinv)
    
    ## Return value of matinv, the inverted matrix, and end
    matinv
  }
