

locateFile <- function(directory, i) {
  if (i<10) {
    filename = paste(directory, "/","00", i, ".csv", sep="")
  } else if (i >= 10 && i < 100) {
    filename = paste(directory, "/", "0", i, ".csv", sep="")
  } else {
    filename = paste(directory, "/", i, ".csv", sep="")
  }
}

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  result <- data.frame(id=numeric(), nobs=numeric())
  for (i in id) {
    filename <- locateFile(directory, i)
    data <- read.csv(filename)
    result <- rbind(result, data.frame(id=i, nobs=nrow(data[complete.cases(data), ]))) 
  }
  result
}
