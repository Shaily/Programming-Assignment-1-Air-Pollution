
locateFile <- function(directory, i) {
  if (i<10) {
    filename = paste(directory, "/","00", i, ".csv", sep="")
  } else if (i >= 10 && i < 100) {
    filename = paste(directory, "/", "0", i, ".csv", sep="")
  } else {
    filename = paste(directory, "/", i, ".csv", sep="")
  }
} 

pollutantmean <- function(directory, pollutant, id = 1:332) {
  allData <- numeric()
  for (i in id) {
    filename <- locateFile(directory, i)
    data <- read.csv(filename)
    if (pollutant == "sulfate") {
      allData <- c(allData, data$sulfate)
    } else if (pollutant == "nitrate") {
      allData <- c(allData, data$nitrate)
    }
  }
  mean(allData, na.rm=TRUE)
} 
