locateFile <- function(directory, i) {
  if (i<10) {
    filename = paste(directory, "/","00", i, ".csv", sep="")
  } else if (i >= 10 && i < 100) {
    filename = paste(directory, "/", "0", i, ".csv", sep="")
  } else {
    filename = paste(directory, "/", i, ".csv", sep="")
  }
}
corr <- function(directory, threshold = 0) {
  obs <- complete(directory, 1:332)
  sulfate <- numeric()
  nitrate <- numeric()
  result <- numeric()
  for (i in obs$id[obs$nobs > threshold]) {
    filename <- locateFile(directory, i)
    data <- read.csv(filename)
    result <- c(result, cor(data$sulfate, data$nitrate, use="complete.obs"))
  }
  result  
}
