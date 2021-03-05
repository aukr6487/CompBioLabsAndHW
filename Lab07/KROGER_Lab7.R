# Aubrey Kroger 
# EBIO 5420
# Lab 7

# Problem 1 - function that returns area of a triangle given base and height
triangleArea <- function(base, height) {
  return( 0.5 * base * height)
}
triangleArea( 3, 4)

# Problem 2 - function that returns absolute value of numbers
myAbs <- function(number) {
  ifelse (number >= 0, number, -1*number)
  # if number is greater or equal to 0, return the number. if not, return -1*number
}
myAbs(5)
myAbs(-2.3)
myAbs(c(1.1, 2, 0, -4.3, 9, -12))

# Problem 3 - function that prints fibonocci sequence given length n and starting value start
printFib <- function(n, start) {
  # Checking for invalid input arguments 
  if (n <= 0 ){
    print("Error: Invalid input. Please enter n > 0. Will return NULL")
    return()
  }
  if (start != 0 & start != 1) {
    print("Error: Invalid input. Please enter start = 1 or 0. Will return NULL.")
    return()
  }
  
  # n == 2 and start == 1 or 0
  if (n == 1){
    return(start )
  }
  
  fibVector <- rep(NA, n) # allocate vector space
  
  # n == 2 and start == 0
  if ( n == 2 & start == 0){
    fibVector[1] <- start
    fibVector[2] <- start + 1
    return(fibVector)
  }
  
  # n == 2 and start == 1
  if ( n == 2 & start == 1) {
    fibVector[1] <- start
    fibVector[2] <- start
    return(fibVector)
  }
  
  # n >= 3 and start == 0
  if (start == 0) {
    fibVector[1] <- start
    fibVector[2] <- start + 1
    for (i in 3:n) {
      fibVector[i] <- fibVector[i - 1] + fibVector[i - 2]
    }
    return(fibVector)
  }
  
  # n >= 3 and start == 1
  fibVector[1] <- start
  fibVector[2] <- start 
  for (i in 3:n) {
    fibVector[i] <- fibVector[i - 1] + fibVector[i - 2]
  }
  return(fibVector)
}

# Problem 4a
# function calculating the square difference of two numbers x and y
squareDiff <- function(x, y){
  return( abs( (x - y) ^ 2 ) )
}
squareDiff(3, 5)
squareDiff(c(2, 4, 6), 4)

# Problem 4b
# function calculating the arithmetic mean of a vector of numbers
arithMean <- function(vector) {
  if (class(vector) == "data.frame") {
    vector <- vector[,1]
  }
  return( sum(vector) / length(vector) )
}
arithMean( c(5, 15, 10) )
setwd('~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Lab07')
testFrame <- read.csv( "DataForLab07.csv" )
arithMean(testFrame)

# Problem 4c 
# function calculating "sum of squares" of a vector 
sumOfSquares <- function(data) {
  if (class(data) == "data.frame") {
    data <- data[,1]
  }
  squaredDifferences <- squareDiff(data, arithMean(data))
  return( sum( squaredDifferences ) )
}
sumOfSquares(testFrame)
