# Working with some data from the Colorado Department of Public Health
# and Environment (CDPHE) on COVID-19 in Colorado.

# Change the next line to work for YOUR OWN computer:
setwd("~/Desktop/Classes/EBIO_5420/compBioSandbox/CompBio_on_git/Datasets/COVID-19/CDPHE_Data/CDPHE_Data_Portal/")

stateStatsData <- read.csv("DailyStateStats2/CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                           stringsAsFactors = F)


####################################################
## Explore the data
####################################################
# here are some suggestions for simple exploration , but please use your own ideas!
names(stateStatsData) 
str(stateStatsData)
summary(stateStatsData)
unique(stateStatsData$Name)
unique(stateStatsData$Desc_)
table(stateStatsData$Name)

##################################################################
##  Tasks
##################################################################

# try to figure out ways to do all of the following using functions 
# from the Tidyverse

require("lubridate")
require("dplyr")

# 1. subset the data so that we only keep the rows where the text in the column (variable) named "Name" is "Colorado"

# 2. subset to keep (select) only the columns "Date", "Cases", and "Deaths"

# 3. change the data in the "Date" column to be actual dates rather than a character

# 4. sort the data so that the rows are in order by date from earliest to latest

# 5. subset the data so that we only have dates prior to May 15th, 2020

# Put all steps together !!!
ColoradoData <- stateStatsData %>%
  filter( Name == "Colorado" ) %>%
  select( Date, Cases, Deaths ) %>%
  mutate( Date = parse_date_time(x = Date, orders = c("mdY")) ) %>%
  # or could use mutate ( Date = strptime(Date, format = %m/%d/%Y", tz = " "))
  arrange( Date ) %>%
  filter( Date < as.POSIXlt("2020-05-15") )

# PART 2
ColoradoData2 <- ColoradoData %>%
  filter( Date < as.POSIXlt("2020-05-01"))

require("ggplot2")
p <- ggplot(data = ColoradoData2, aes(x = Date, y = Cases)) + 
  geom_line() +
  scale_y_log10()
p2 <- ggplot( data = ColoradoData2, aes( x = Date, y = Deaths)) + 
  geom_line() +
  scale_y_log10()

# PART 3
doublingTime <- c(2, 3, 5, 7, 10)
dateZero <- min(ColoradoData$Date)
nInit <- ColoradoData$Cases[ ColoradoData$Date == dateZero ]
maxDate <- as.POSIXlt("2020-05-01")
DataPoints <- seq( from = dateZero,
                   to = maxDate,
                   by = doublingTime[1]) # attempting with just the first doubling time value to see if it works... maybe will put this in a for loop later??
doublingEvents <- 0:(length(DataPoints) - 1)
doublingRefNums <- 2^(doublingEvents[1] * nInit)

ReferenceData <- data.frame( DataPoints, doublingRefNums )
p <- p + geom_line( data = ReferenceData, aes( x = DataPoints, y = doublingRefNums))

#  Hm I keep getting an error that says "object 'Cases' not found" ... 

  



