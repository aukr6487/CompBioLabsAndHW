# Add Time Column (only do once per centroids folder)
setwd("~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Assignment_08/centroids2")
num_files <- 200
for(i in 1:num_files) {
  plotting_data <- read.csv(paste( c("centroids_", i, ".csv"), collapse = "") )
  plotting_data <- cbind(plotting_data, Time = i)
  setwd("~/Desktop/Classes/EBIO_5420/CompBioLabsAndHW/Assignment_08/centroids2/centroids_time")
  write.csv(plotting_data, paste( c("centroids_TIME_", i, ".csv"), collapse = "") )
  wd <- getwd()
  setwd("..")
  parent <- getwd()
  setwd(parent)
}
