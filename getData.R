rm(list=ls())
fn <- "household_power_consumption.txt"
if (!file.exists(fn)) {
  fileUrl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  if(Sys.info()["sysname"] == "Windows"){
    download.file(fileUrl1, fn)
  }
  else {
    download.file(fileUrl1, fn, method="curl")  
  }
  fz <- "exdata-data-household_power_consumption.zip"
  download.file(fileUrl1,fz)
  #dateDownloaded <- date()
  print(dateDownloaded)
  unzip(fz,fn)
  rm(fileUrl1)
  rm(fz)
}

#require("sqldf")
#mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
#myData <- read.csv2.sql(fn,mySql, header=TRUE)

###
# It can be done only reading the conrresponding rows from file.
# for now read all rows and subset them
###

tab5rows <- read.table(fn, header = TRUE, nrows = 5, na.strings="?",sep=";")
classes  <- sapply(tab5rows, class)
rm(tab5rows)

setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setClass('myDate')
classes[1] <- 'myDate'
tabAll   <- read.table(fn, header = TRUE, na.strings="?",sep=";", colClasses=classes, as.is=TRUE)
data <- subset(tabAll, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data <- within(data,DateTime <- paste(Date, Time, sep=" "))
rm(tabAll)
rm(classes)
rm(fn)

