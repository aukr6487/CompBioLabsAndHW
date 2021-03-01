# Aubrey Kroger 
# EBIO 5420
# Lab05

# PART I #

# Step 1
# if/else statement to check if x is larger than threshold value
x <- 3
threshold <- 5
if (x > threshold) {
  print(paste(x, "is larger than", threshold))
} else {
  print(paste(x, "is not larger than", threshold))
}

# Step 2
# Import ExampleData.csv and make into a vector 
setwd('~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Lab05')
ExampleData <- read.csv("ExampleData.csv")
ExampleDataVec <- ExampleData$x

# Step 2a 
# If value in ExampleDataVec is negative, change to NA
for (i in 1:length(ExampleDataVec)){
  if(ExampleDataVec[i] < 0){
    ExampleDataVec[i] <- NA
  }
}

# Step 2b
# Change NA values to NaN in ExampleDataVec using logical indexing 
NAValues <- is.na(ExampleDataVec) 
ExampleDataVec[NAValues] <- NaN

# Step 2c
# Change NaN values to 0 using which() and indexing 
NANValues <- is.nan(ExampleDataVec)
ExampleDataVec[which(NANValues)] <- 0

# Step 2d 
# Determine how many values in ExampleDataVec are between 50 and 100
NumberOfValues <- 0 # number of values between 50 and 100
max <- 100
min <- 50
for (i in 1:length(ExampleDataVec)){
  if(ExampleDataVec[i] <= max & ExampleDataVec[i] >= min){
    NumberOfValues <- NumberOfValues + 1
  }
}

# Step 2e 
# Create array with all values of ExampleDataVec that are between 50 and 100
FiftyToOneHundred <- ExampleDataVec[ExampleDataVec <= max & ExampleDataVec >= min]

# Step 2f 
# Saving FiftyToOneHundred vector to FiftyToOneHundred.csv
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

# Step 3 
# Import CO2_data_cut_paste.csv
CO2_Data <- read.csv("CO2_data_cut_paste.csv")

# Step 3a
Non_Zero_Gas_Indexes <- which(CO2_Data$Gas > 0) #Non_Zero_Gas_Indexes 
# is a vector containing the indexes where CO2_Data has non zero gas emissions
CO2_Data$Year[Non_Zero_Gas_Indexes[1]] # prints the first year for which data on Gas emissions were non-zero

# Step 3b
Total_Emissions <- which(CO2_Data$Total >= 200 & CO2_Data$Total <= 300)
CO2_Data$Year[Total_Emissions] # prints the years where "Total" emissions were between 200-300 million metric tons of carbon

# PART II #

# Define variables 
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

t <- 1:totalGenerations # time vector 
AbundanceOfPrey <- rep(NA,totalGenerations) # create vector to store values of n over time
AbundanceOfPredators <- rep(NA, totalGenerations) # create vector to store values of p over time 

# initialize vector values starting at time t = 1
AbundanceOfPrey[1] <- initPrey
AbundanceOfPredators[1] <- initPred
# For loop of Lotka-Volterra Predator-Prey Model, starting at t = 2
for (i in 2:totalGenerations) {
  AbundanceOfPrey[i] <- AbundanceOfPrey[i-1] + (r * AbundanceOfPrey[i-1]) - (a * AbundanceOfPrey[i-1] * AbundanceOfPredators[i-1])
  AbundanceOfPredators[i] <- AbundanceOfPredators[i-1] + (k * a * AbundanceOfPrey[i-1] * AbundanceOfPredators[i-1]) - (m * AbundanceOfPredators[i-1])
  if (AbundanceOfPredators[i] < 0) {
    AbundanceOfPredators[i] <- 0
  }
  if (AbundanceOfPrey[i] < 0) {
    AbundanceOfPrey[i] <- 0
  }
}

# Create plot of AbundanceOfPrey and AbundanceOfPredators over time 
plot(t, AbundanceOfPrey)
lines(t, AbundanceOfPredators)

# Create matrix of results and save in csv
numCols <- 3 # 3 columns in new matrix
nameCols <- c("TimeStep", "PreyAbundance", "PredatorAbundance") # names of the 3 columns
myResults <- matrix(c(t, AbundanceOfPrey, AbundanceOfPredators), ncol = numCols)
colnames(myResults) <- nameCols
write.csv(x = myResults, file = "PredPreyResults.csv")

# PART III #

# Define new variables 
initPrey <- seq(from = 10, to = 100, by = 10) 	# various initial prey abundances at time t = 1

AbundanceOfPredators[1] <- initPred # AbundanceOfPredators at time = 1
# For loop, looping through different initPrey values 
for (l in 1:length(initPrey)) { 
  AbundanceOfPrey[1] <- initPrey[l] # AbundanceOfPrey at time t = 1 
  # For loop of Lotka-Volterra Predator-Prey Model, starting at t = 2
  for (i in 2:totalGenerations) {
    AbundanceOfPrey[i] <- AbundanceOfPrey[i-1] + (r * AbundanceOfPrey[i-1]) - (a * AbundanceOfPrey[i-1] * AbundanceOfPredators[i-1])
    AbundanceOfPredators[i] <- AbundanceOfPredators[i-1] + (k * a * AbundanceOfPrey[i-1] * AbundanceOfPredators[i-1]) - (m * AbundanceOfPredators[i-1])
    if (AbundanceOfPredators[i] < 0) {
      AbundanceOfPredators[i] <- 0
    }
    if (AbundanceOfPrey[i] < 0) {
      AbundanceOfPrey[i] <- 0
    }
  }
  # Create matrix of results and save in csv (creating 10 different csv files for the 10 different initPrey values)
  numCols <- 3 # 3 columns in new matrix
  nameCols <- c("TimeStep", "PreyAbundance", "PredatorAbundance") # names of the 3 columns
  myResults3 <- matrix(c(t, AbundanceOfPrey, AbundanceOfPredators), ncol = numCols)
  colnames(myResults3) <- nameCols
  write.csv(x = myResults3, file = paste0("PredPreyResultsForInitPrey", initPrey[l], ".csv")) # naming csv file to include initPrey value for easy cross-referencing 
}

# I thought it would be cleaner to save all of the data as 10 separate csv files.


