# Aubrey Kroger
# EBIO 5423
# Lab09

setwd('~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Lab09')
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# Problem 1
# try problem 1 on a smaller portion (just first entry)
testString <- camData$DateTime[1]
strptime(testString, format = "%d/%m/%Y %H:%M")
# apply learning to entire column 
camData$DateTime <- strptime(camData$DateTime, format = "%d/%m/%Y %H:%M")

# Problem 2
camData2 <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# Can I find the inconsistent formatting by looking at lengths?
length(camData2$DateTime[1])
# Look at where the full 4 digit year would be in the string 
testString2 <- substr(camData2$DateTime[1],7,10)
# Compare this to 2013 
"2013" == testString2

# Now look at entire column
testString2 <- substr(camData2$DateTime,7,10)
#Compare to 2013 and store T/F values in array
logic <- "2013" == testString2
# whiche of the string are FALSE? aka, which indices have the inconsistent formatting
inconsistent <- which(!logic)
# Change inconsistent data formats
camData$DateTime[inconsistent] <- strptime(camData2$DateTime[inconsistent], format = "%d/%m/%y %H:%M")
# Test a few previously inconsistent points to make sure it worked
camData$DateTime[498]
camData$DateTime[2399]

# Problem 3, this should now be an accurate vector of dates and times 
camData$DateTime

# Problem 4
# What season, station, or species do you want to look at?

# Pick chosen season indices
season <- which(camData$Season == "D") #Put any season you want to look at, I'm using D in this example

# Pick chosen station indices
station <- which(camData$Station == "10") # Put any station you want to look at, I'm looking at station 10

# Pick chosen species indiecs
species <- which(camData$Species == "Elephant") # Put any species you want to look at, I'm looking at Elephant

# Where does chosen season and station intersect?
intersection1 <- season %in% station
# Where does (season/station) intersection intersect species?
intersection2 <- season[intersection1] %in% species

# Find DateTime values at the total intersection points
camData$DateTime[which(intersection2)]

# I don't really know what it means to compute the average time between observations
# but I think I'm just going to compute the average of all of the time values at the 
# intersection of chosen season, station, and species

length(which(intersection2)) # how many entries are in this intersection?

# This is as far as I got! Still trying to think about how to make these strings 
# that represent time into numbers so that I can compute the average.
# Would a mean() function be able to computer average TIME? 
