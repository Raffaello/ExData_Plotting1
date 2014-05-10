source("getData.R")

#Setting approriate Locale for "matching" week of days
#Sys.setlocale("LC_TIME","English United States")


x <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", bg = "transparent", width=480, height=480)
plot(x,data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()