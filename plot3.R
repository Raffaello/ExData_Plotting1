source("getData.R")

x <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
yrange <- range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))

png(file = "plot3.png", bg = "transparent", width=480, height=480)
with(data, {
  plot(x, Sub_metering_1, ylim=yrange, type='l', ylab="Energy sub metering")
  #par(new=TRUE)
  points(x, Sub_metering_2, ylim=yrange, type='l', col="red")
  #par(new=TRUE)
  points(x, Sub_metering_3, ylim=yrange, type='l', col="blue")
  legend("topright",lty=1 , col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

