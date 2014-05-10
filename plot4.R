source("getData.R")

x <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
yrange <- range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
                  
png(file = "plot4.png", bg = "transparent", width=480, height=480)
par(mfrow = c(2, 2))
with(data, {
  plot(x,data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
  
  plot(x, Voltage, type='l', xlab="datetime", ylab="Voltage")
  
  plot(x, Sub_metering_1, ylim=yrange, type='l', ylab="Energy sub metering")
  #par(new=TRUE)
  points(x, Sub_metering_2, ylim=yrange, type='l', col="red")
  #par(new=TRUE)
  points(x, Sub_metering_3, ylim=yrange, type='l', col="blue")
  legend("topright",lty=1 , col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  
  plot(x, Global_active_power, type='l', xlab="datetime")
})
dev.off()