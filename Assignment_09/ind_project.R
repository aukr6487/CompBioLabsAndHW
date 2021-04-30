# Aubrey Kroger 
# Independent Project 
# EBIO 5420 

# First I read in all the csv files, added column "time", and created a new folder 
# with all of the csv files with the time column added. 
# This is only done once! 

# Add Time Column (only do once per centroids folder)
#setwd("~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Assignment_09/centroids2")
#num_files <- 200
#for(i in 1:num_files) {
#  plotting_data <- read.csv(paste( c("centroids_", i, ".csv"), collapse = "") )
#  plotting_data <- cbind(plotting_data, Time = i)
#  write.csv(plotting_data, paste( c("centroids_", i, ".csv"), collapse = "") )
#}

library(dplyr)
library(readr)
require("lubridate")
require("dplyr")

setwd("~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Assignment_09/centroids2")

# Bind the rows of all of these csv files, select only Centroid_1 and 2 (x,y) and Time columns
df <- list.files(path="centroids_time", full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows %>%
  select( Centroid_1, Centroid_2, Time ) %>%
  arrange( Time ) %>%
  filter( Centroid_1 > 200 ) # This is filtering out the centroid dots that were plotted on the axis points and time legend

# These are the x,y coordinates of the other axis points that are not deleted by the filter function above (x axis ticks)
x <- c(257, 345, 432, 520, 608)

y <- c(602, 602, 602, 602, 602)

# For loop loops through data frame df and deleted rows that have either x or y coordinate
for( i in 1:length(x) ) {
  index_x <- which( df[1] == x[i] )
  index_y <- which( df[2] == y[i] )
  to_delete <- intersect(index_x, index_y)
  if( length(to_delete) > 0) {
    df <- df[-to_delete, ]
  }
}

# df is a dataframe that now has all of the centroids we are interested in from the csv's

# SheepDX and SheepDY contain that (x,y) coordinates of the sheepdog at each frame 
# Note: Some of these points are in the csv file and some of them, the MATLAB code was unable to generate the centroid
# so I determined the centroid by inspection

SheepDX <- c(245.961538461538, 247.981132075472, 249.037735849057, 249.055555555556, 251, 251.962264150943, 252.981481481481,
            255.038461538462, 259, 261.018181818182, 261.962264150943, 263.962962962963, 267.038461538462, 269.882352941176, 
            270.018518518519, 272, 270.901960784314, 267.038461538462, 265.05556, 263.035714285714, 263.037735849057, 
            263.037735849057, 263.055555555556, 265.072727272727, 267.944444444444, 273.089285714286, 281.055555555556, 289.960784313725, 
            299.037735849057, 307, 313.055555555556, 319, 323, 327.055555555556, 333.961538461538, 341.944444444444, 352, 363.037735849057,
            374.018181818182, 387.037735849057, 400.018181818182, 413, 422.981818181818, 432.018181818182, 438.981818181818, 443.944444444444,
            447.038461538462, 449.980769230769, 453.888888888889, 459.037735849057, 464, 469.018181818182, 473.071428571429, 477, 481.072727272727,
            483.945454545455, 487.055555555556, 490, 491.039215686275, 491.038461538462, 488, 483.981818181818, 483.981818181818,
            475.944444444444, 471.962264150943, 467, 461.88, 455.962264150943, 451.037735849057, 441, 435, 435, 438, 437.037037037037, 437.962264150943,
            435.962264150943, 433.961538461538, 432.037037037037, 431.076923076923, 429.038461538462, 427, 424, 421, 415.962264150943, 
            417.057692307692, 416.01724137931, 415, 416, 413, 410, 402, 395, 390, 385, 383, 380, 379, 375, 385.037735849057, 384, 383, 382.018181818182,
            380.963636363636, 381.961538461538, 385.038461538462, 385.038461538462, 383, 379.961538461538, 377.078431372549, 373.018181818182, 370,
            369.037037037037, 369.055555555556, 368, 367, 364.964285714286, 363.037735849057, 360, 357, 355, 361.037735849057, 363, 362, 357.981481481481, 353.072727272727,
            351.019230769231, 354, 359.037735849057, 361.962264150943, 362, 359.037735849057, 355.962264150943, 353.944444444444, 352, 351.037735849057, 351,
            347.84, 344.019230769231, 339.944444444444, 339.055555555556, 337.981132075472, 333.88, 331, 330, 327, 325, 324, 321, 318, 316, 313, 310, 307, 305, 305, 305, 304.017857142857,
            302, 299, 296, 292, 289, 287, 285, 285, 285, 284, 284, 284, 283.944444444444, 281.055555555556, 279, 277, 274, 269, 264, 259, 258, 257, 256, 255, 254, 250, 248, 246,
            244, 244, 243.5, 243.5, 243.081632653061, 242, 240.018518518519, 237, 233, 228, 228, 228, 227.903846153846, 224, 221.862745098039)

SheepDY <- c(310.961538461538, 310.962264150943, 311, 309.981481481481, 308.962264150943, 308, 306.055555555556, 
            304.038461538462, 302.964285714286, 302.981818181818, 304, 304.055555555556, 304.961538461538, 307, 
            308.888888888889, 308, 308.058823529412, 304.961538461538, 302.018519, 300, 299, 
            299, 302, 303, 300.018518518519, 294, 288.981481481481, 284, 280, 278, 274.981481481481, 272.962264150943, 272.035714285714,
            273, 272.038461538462, 270, 267, 264, 261.981818181818, 258.094339622641, 255.018181818182, 251, 245.981818181818, 237.981818181818,
            229.981818181818, 220.018518518519, 206.961538461538, 194.076923076923, 179.981481481481, 167, 155, 144.018181818182, 132.946428571429,
            124, 115, 106.072727272727, 97, 90.0727272727273, 83, 74.9615384615385, 68.0377358490566, 62.9818181818182, 62.9818181818182,
            64.0185185185185, 68, 72.1176470588235, 76.04, 77.9811320754717, 81, 78, 83, 85, 90.0377358490566, 94.9444444444444, 100, 103,
            106.961538461538, 110.018518518519, 114.980769230769, 118.942307692308, 122.960784313725, 123.962264150943, 122, 123, 128.961538461538,
            132.948275862069, 138, 147, 158, 157, 155, 154, 154, 155.5, 160, 163, 166, 170, 176, 181.964285714286, 186.094339622642, 186.127272727273,
            186.109090909091, 190.961538461538, 202.038461538462, 212.961538461538, 218.150943396226, 212.961538461538, 202.941176470588, 192.018181818182,
            189, 188.925925925926, 194.981481481481, 203, 210, 212.875, 211, 210, 208, 213, 223, 235.037735849057, 240.035714285714, 238.055555555556, 232,
            228.865384615385, 234.037735849057, 244, 254, 257, 253.981132075472, 252, 249.018518518519, 249.035714285714, 249, 248, 244.1, 
            236.076923076923, 229.981481481481, 233.018518518519, 238.962264150943, 243.04, 250, 253, 255, 257, 261, 265, 263, 262, 264, 267, 270, 271.5, 271.5, 271.5, 276.928571428571,
            280, 284, 280, 279, 283, 285, 289, 290, 291, 292, 292, 292, 294.981481481481, 297.018518518519, 299, 301, 304, 305, 304, 303, 302, 301, 300, 299, 298, 296, 295.5, 295,
            295, 293, 291, 295, 294.897959183673, 292.962264150943, 290.055555555556, 288, 287, 285.9, 290, 290, 290.076923076923, 287, 284.058823529412)

# I want to label in df which one is a sheep dog so I add a column called "Sheepdog" to df
df <- cbind(df, Sheepdog = 0)

# For loop, looping through length of sheepdog x coordinates, SheepDX
for( i in 1:length(SheepDX)) { 
  # indexx contains the row # where a df x coordinate == the sheepdog x coordinate
  indexx <- which( df[1] == SheepDX[i] )
  # indexy contains the row # where a df y coordinate == the sheepdog y coordinate
  indexy <- which( df[2] == SheepDY[i] ) 
  # sheepd_lab is the intersect of indexx and indexy (this is either the row of the correct sheepdog coordinates that are found in df or 0)
  sheepd_lab <- intersect(indexx, indexy) 
  
  # If there is only one intersection point, than df (row determined by sheepd_lab, column 4) is labeled with a "1" to indicate this is a sheepdog in the frame 
  if( length( sheepd_lab ) == 1 ) {  
    df[sheepd_lab, 4] <- 1
  } else { # Else = this was a centroid point that I determined by inspection so this data must be added to df
    # I create a data frame (add_sheepd) with the (x,y) coordinates that need to be added, frame # (or time), and label it as a sheep
    # This data frame is then rbind-ed to df (the sheepdog data done by inspection is added to df)
    add_sheepd <- data.frame( SheepDX[i], SheepDY[i], i, 1)
    names( add_sheepd ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
    df <- rbind(df, add_sheepd)
  }
}

# This was then a check to determine if some of these loops didn't work. At the very least, 
# every time frame should have 2 centroids (one for sheep flock and one for the sheepdog)

# This for loop checks for # of centroids found for each time frame and prints some helpful statements.
# Unfortunately, a few rows didn't work and I'm not too sure why. It might be that the (x,y) coordinates for some
# of these were repeated in SheepDX and SheepDY, causing an intersect length > 1. 

# for(i in 1:200) {
#   number <- nrow(df[which(df[,3] == i), ])
#   if (number == 1){
#     print(c("this row has 1 centroid", i))
#   } else {
#     print("all have more than 1 centroid")
#   }
# }

# Anyway - these are the rows that didn't work, so I am adding them by hand. 

# 63 didnt work  
add_sheep <- data.frame(SheepDX[63], SheepDY[63], 63, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# 155 didnt work 
add_sheep <- data.frame(SheepDX[155], SheepDY[155], 155, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# 156 didnt work
add_sheep <- data.frame(SheepDX[156], SheepDY[156], 156, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# 168 didnt work 
add_sheep <- data.frame(SheepDX[168], SheepDY[168], 168, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# 169 didnt work
add_sheep <- data.frame(SheepDX[169], SheepDY[169], 169, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# 186 didnt work 
add_sheep <- data.frame(SheepDX[186], SheepDY[186], 186, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# 197
add_sheep <- data.frame(SheepDX[197], SheepDY[197], 197, 1)
names( add_sheep ) <- c( "Centroid_1", "Centroid_2", "Time", "Sheepdog")
df <- rbind(df, add_sheep)

# The sheepdog is now labeled in every frame and the data should only be the sheep and sheep dog centroids!
# Maybe for ease of calculations, we can split up our data frame into 2 - one containing only sheep, and the other the sheepdog

# sheepdog = sheepdog centroid at each time
sheepdog <- df %>%
  filter( Sheepdog == 1 ) %>%
  select( Centroid_1, Centroid_2, Time ) %>%
  arrange( Time )

# double value for some reason in row 189?? 
sheepdog <- sheepdog[-189, ]

# sheeps = all of the sheep centroids at each time 
sheeps <- df %>%
  filter( Sheepdog == 0) %>%
  select( Centroid_1, Centroid_2, Time ) %>%
  arrange( Time )

# average_sheeps = centroid of flock at each time (centroid is determined as the average of the sheep locations)
average_sheeps <- sheeps %>%
  group_by( Time ) %>%
  summarise( mean_x = mean(Centroid_1), mean_y = mean(Centroid_2))

# sheep_distance = distance from sheepdog to centroid of flock over time 
# create sheep_distance data frame
sheep_distance <- data.frame(matrix(NA, nrow = 200, ncol = 2))
names(sheep_distance) <- c("distance", "time")

for( i in 1:200 ) {
  # for each time frame, calculate the distance of the sheepdog from the center of the flock
  sheep_distance$distance[i] <- (average_sheeps$mean_x[i] - sheepdog$Centroid_1[i])^2 + (average_sheeps$mean_y[i] - sheepdog$Centroid_2[i])^2
  # distance equation used is (x1 - x2)^2 + (y1 - y2)^2
  sheep_distance$time[i] <- i
}

# stragglers = distance of each sheep from the flock centroid over time
# create stragglers data frame 
stragglers <- data.frame( matrix(NA, nrow = nrow(sheeps), ncol = 2))
names(stragglers) <- c("time", "value")

# For each centroid value of sheep (located in "sheeps" dataframe), label the time value and the distance of that sheep from the flock center
for(i in 1:nrow(sheeps)) {
  t <- sheeps$Time[i]
  stragglers[i, 1] <- t
  stragglers[i, 2] <- (sheeps$Centroid_1[i] - average_sheeps$mean_x[t])^2 + (sheeps$Centroid_2[i] - average_sheeps$mean_y[t])^2
  # distance equation used is (x1 - x2)^2 + (y1 - y2)^2
}

# furthest sheep = max value of stragglers (furthest sheep from the flock centroid at each time)
furthest_sheep <- stragglers %>%
  group_by( time ) %>%
  summarise( furthest = max(value))

# flock cohesion, a measure of flock "closeness" over time
# flock cohesion = the mean of all sheep distances to the flock centroid
flock_cohesion <- stragglers %>%
  group_by( time ) %>%
  summarise( mean = mean(value))

# Ideally, we want to see a correlation between sheepdog distance and flock cohesion in our graphs 

# Plot sheepdog distance from flock center over time 
require("ggplot2")
p <- ggplot(data = sheep_distance, aes(x = time, y = distance)) + 
  geom_line() + ggtitle("Sheepdog distance from center of flock") + xlab("Time") + ylab("Distance")

# Plot distance of furthest sheep from flock center over time 
p2 <- ggplot(data = furthest_sheep, aes(x = time, y = furthest)) +
  geom_line() + ggtitle("Distance of furthest sheep from center of flock") + xlab("Time") + ylab("Distance")

# Plot flock cohension over time 
p3 <- ggplot(data = flock_cohesion, aes(x = time, y = mean)) +
  geom_line() + ggtitle("Flock cohesion") + xlab("Time") + ylab("Distance")

install.packages("gridExtra")
library("gridExtra")
grid.arrange(p, p2, p3, ncol = 1, nrow = 3) 

# Where does the biggest change in flock cohesion occur? 
# I noticed a big change in flock cohesion occur right before the 50 frame mark
# so I am interested in before the 50 frame mark but after the 25 frame mark 
from <- 25
to <- 50
max <- 0
index <- 0
for (i in from:to) {
  distance <- flock_cohesion[i+1, 2] - flock_cohesion[i, 2]
  if( distance > max) {
    max <- distance
    index <- i
  }
}
max
index

# I tried this again, looking before 48 to see when more jumps occured in flock cohesion
from <- 25
to <- 45
max <- 0
index <- 0
for (i in from:to) {
  distance <- flock_cohesion[i+1, 2] - flock_cohesion[i, 2]
  if( distance > max) {
    max <- distance
    index <- i
  }
}
max 
index

# This is the distance the sheepdog is from the flock center when they begin to cluster.
# This can be done with either value of index above. 
begin_cluster <- sheep_distance[index, 1]
