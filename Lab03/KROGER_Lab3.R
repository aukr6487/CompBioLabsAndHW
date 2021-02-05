# Aubrey Kroger
# EBIO 5420
# Lab03 

### PART 1 ### 
## Step #3 ##
# x = number of delicious flaming hot cheetos
# y = number of guests 
x <- 5 
y <- 8  

## Step #5 ##
# a = average amount of chips a guest will eat
a <- 0.4

## Step #7 ##
# z = expected amount of chips leftover 
z <- x - ((y * a) + 0.4)

### PART 2 ###
## Step #8 ##
# rankings of star wars movies 1-9 for Me, Penny, Lenny, and Stewie
Me <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
Penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

## Step #9 ##
# PennyIV = Penny's ranking for Episode 4
# LennyIV = Lenny's ranking for Episode 4
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

## Step #10 ##
# rankings = matrix of star wars rankings
rankings <- cbind(Me, Penny, Lenny, Stewie)

## Step #11 ##
# the structure of "PennyIV" is just a single number 3 
str(PennyIV)
# the structure of "Penny" is an array or vector of 9 values listing the ...
# rankings of star wars movies 1-9
str(Penny)
# the structure of "rankings" is a matrix with 9 rows & 4 columns consisting ...
# of the rankings of the 1-9 star wars movies for the 4 guests 
str(rankings)

## Step #12 ##
# making data frame (df) using the 4 vectors of rankings
df <- data.frame(Me, Penny, Lenny, Stewie)
# trying another command to make data frame (df2) using the 4 vectors of rankings
df2 <- as.data.frame(df)

## Step #13 ##
# Both "df" and "rankings" are a 9x4 matrix, consisting of the same values.
# The object "rankings" is technically a structure of numbers, and "df" is a
# data frame consisting of 9 obs. of 4 variables. R stores the objects i "rankings"
# as a double and the objects in "df" as a list

## Step #14 ##
# Episodes is a character string of the star wars episode names as Roman numerals
Episodes <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

## Step #15 ##
# changing the row names of both "rankings" and "df" to be Episodes character string
row.names(rankings) <- Episodes
row.names(df) <- Episodes

## Step #16 ##
# accessing the 3rd row of "rankings" matrix which is everyone's rankings of the 3rd movie
rankings[3,]

## Step #17 ##
# accessing the 4th column of "df" which is Stewie's rankings of the movies
df[,4]

## Step #18 ##
# accessing my ranking for Episode V
rankings[5,1]

## Step #19 ##
# accessing Penny's ranking for Episode II
rankings[2,2]

## Step #20 ##
# accessing everyone's rankings for episodes IV-VI
rankings[4:6,]

## Step #21 ##
# accessing everyone's rankings for episodes II, V, & VII
rankings[c(2,5,6),]

## Step #22 ##
# access rankings for Penny & Stewie for episodes IV and VI
rankings[c(4,6),c(2,4)]

## Step #23 ##
# swap Lenny's rankings for Episodes II and V
# rank = Lenny's rankings for Episode II
rank <- rankings[2,3]
rankings[2,3] <- rankings[5,3]
rankings[5,3] <- rank

## Step #24 ##
# access Penny's rating of Episode III
rankings["III", "Penny"]
df["III", "Penny"]

## Step #25 ##
# swapping again Lenny's rankings for Episodes II and V
rank2 <- rankings["II", "Lenny"]
rankings["II", "Lenny"] <- rankings["V", "Lenny"]
rankings["V", "Lenny"] <- rank2

## Step #26 ##
# swapping AGAIN Lenny's rankings for Episodes II and V (in "df" instead of "rankings")
rank3 <- df$Lenny[2]
df$Lenny[2] <- df$Lenny[5]
df$Lenny[5] <- rank3