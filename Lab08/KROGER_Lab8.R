# Aubrey Kroger 
# EBIO 5420
# Lab 8

## Problem 7 copied from Lab 04 work:

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

# Turning the code above into a function that takes `r` (the intrinsic growth rate), 
# `K` (the carrying capacity), the total number of generations, and the initial 
# population size as its arguments.
logistic_growth <- function(r, K, generations, initial_pop) {
  
  log_growth_data <- matrix(NA, nrow = generations, ncol = 2)
  colnames(log_growth_data)<- c("generations","abundance")
  
  log_growth_data[1,2] <- initial_pop # initial population abundance 
  log_growth_data[1,1] <- 1 # time/generations starts at 1
  
  # calculate abundance using discrete-time logistic growth equation 
  for(i in 2:generations){
    log_growth_data[i, 2] <- log_growth_data[i - 1, 2] + (r * log_growth_data[i - 1 , 2] * (K - log_growth_data[i - 1, 2])/ K )
    log_growth_data[i, 1] <- log_growth_data[i - 1, 1] + 1
  }
  
  return(log_growth_data)
}
# I couldnt figure out how to both return the matrix AND plot inside the function, so I'm plotting outside of the function 

# Test function with different input 
log_growth_data <- logistic_growth(0.8, 10000, 12, 2500)

# plot abundance over time 
plot(log_growth_data[,1], log_growth_data[,2], main = "Discrete-Time Logistic Growth Equation", xlab = "Generations", ylab = "abundance")

# Write data to file 
setwd('~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Lab08')
write.csv(log_growth_data, "Discrete_Time_Log_Growth_Data.csv")

