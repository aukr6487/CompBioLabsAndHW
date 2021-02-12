# Aubrey Kroger
# EBIO 5420
# Lab04

# PART I #

# Step 1
# A for loop that prints the word "hi" 10 times
hiTimes <- 10 
for (i in 1:hiTimes){
  print("hi")
}

# Step 2
# For loop calcuating the total amount of money Tim has
piggyBank <- 10 # dollars
allowance <- 5 # dollars per week
expenses <- 2 * 1.34 # dollars per week
weeks <- 8
for (i in 1:weeks){ 
  piggyBank <- piggyBank + allowance - expenses
  print( piggyBank )
}

# Step 3
# For loop calculating expected population size 
shrinkingRate <- 0.05 # 5% rate
currentPopulation <- 2000 # individuals
years <- 7 
for (i in 1:years){
  currentPopulation <- currentPopulation - currentPopulation*shrinkingRate
  print( currentPopulation )
}

# Step 4
# For loop calculating population abundance using discrete-time logistic growth equation
population <- 2500 # population abundance 
K <- 10000 # environmental carrying capacity for the population
r <- 0.8 # intrinsic growth rate of the population
timeStep <- 12 # predicting population at t = 12
for (i in 1:timeStep){
  population <- population + (r * population * (K - population)/K)
  print( population )
}

# Part II # 

# Step 5a
# Making vector of 18 zeros 
zeros <- 18 # number of zeros in vector 
vector <- rep(0, zeros)
print( vector )

# Step 5b
for ( i in seq(1,18)) {
  vector[i] <- 3 * i
}
print( vector )

# Step 5c
# creating new vector of 18 zeros, then putting 1 in first entry
vectorTwo <- rep(0, zeros)
vectorTwo[1] <- 1
print( vectorTwo )

# Step 5d
for (i in seq(2, 18)) {
  vectorTwo[i] <- 1 + (2 * vectorTwo[i-1])
}
print( vectorTwo )

# Step 6 
# For loop that fills a vector with the Fibonacci sequence
length <- 20 #length of fibVector 
fibVector <- rep(0, length)
fibVector[1] <- 0 # First number of Fibonacci sequence is zero
fibVector[2] <- 1 # Second number of Fibonacci sequence is one
for (i in 3:length) {
  fibVector[i] <- fibVector[i - 1] + fibVector[i - 2]
}
# Should print first 20 Fibonacci numbers starting at 0
print( fibVector )

# Step 7
# defining variables 
timeStep <- 12 # length of time vector and abundance vector
abundance <- rep(0, timeStep)
time <- rep(0, timeStep)
K <- 10000 # environmental carrying capacity for the population
r <- 0.8 # intrinsic growth rate of the population

# define starting values in both vectors 
abundance[1] <- 2500 # population abundance at time t=1
time[1] <- 1 # time starts at t = 1

# For loop calculating population abundance using discrete-time logistic growth equation
for (i in 2:timeStep){
  abundance[i] <- abundance[i - 1] + (r * abundance[i - 1] * (K - abundance[i - 1])/K)
  time[i] <- time[i - 1] + 1 # increase time
}

# plot population abundance over time
plot(time, abundance)


