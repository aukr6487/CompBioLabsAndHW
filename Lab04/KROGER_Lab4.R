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
# For loop calculating the total amount of money Tim has
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

# Part III # ... my attempts 

# Step 8a
# Reading in CO2_data_cut_paste.csv
setwd('~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Lab04')
CO2_Data <- read.csv("CO2_data_cut_paste.csv")

# Step 8b 

# Trying to change data from "integer" to "numeric the first way
CO2_Data2 <- read.csv("CO2_data_cut_paste.csv", colClasses=c("integer", rep("numeric",7)))
# lapply(CO2_Data2, class)
# I used the above command ^ to check that I was able to complete this

# Trying to change data from "integer" to "numeric the second way
CO2_Data3 <- read.csv("CO2_data_cut_paste.csv")
for (i in 2:8) {
  CO2_Data3[,i] <- as.numeric(CO2_Data3[,i])
}
# lapply(CO2_Data3, class)
# I used this command agan to check that it was correct. 

# Step 8c 
# How to calculate percent change: 
# Increase = New Number - Original Number
# Percent change = Increase / Original Number * 100

# First way to calculate percent change... I don't actually know if this is the first way. 

# Define variables and data.frame 
Columns <- 7 # number of columns minus "Years"
Rows <- 263
Increase <- rep(0, Columns) # Create array to contain "Increase" calculation of Year i from Year i-1
PercentChange <- data.frame(matrix(ncol = Columns, nrow = Rows)) # Create matrix size of CO2_Data matrix
Names <- c("Total", "Gas", "Liquids", "Solids", "CementProduction", "GasFlaring", "PerCapita") # Create array of column names
colnames(PercentChange) <- Names # Name columns 

# For loop calculating percent change 
for (i in 2:Rows) {
  Increase <- CO2_Data2[i, 2:8] - CO2_Data2[i-1, 2:8]
  PercentChange[i, ] <- Increase / CO2_Data2[i-1, 2:8] * 100
}

# Second way to calculate percent change

# Define variables and data.frame
PercentChange2 <- data.frame(matrix(ncol = Columns, nrow = Rows)) # Create matrix size of CO2_Data matrix
colnames(PercentChange2) <- Names # Name columns 

# Nested for loop calculating percent change
for(i in 2:Rows){
  for(c in 2:8){
    Increase <- CO2_Data3[i, c] - CO2_Data3[i-1, c]
    PercentChange2[i, c] <- Increase / CO2_Data3[i-1, c] * 100
  }
}
PercentChange2$V8 <- NULL # I don't know why there's an extra column at the end 

# Check that they are the same 
all(PercentChange == PercentChange2) 
# they are not the same... 