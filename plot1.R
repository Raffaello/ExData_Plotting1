source("getData.R")

png(file = "plot1.png", bg = "transparent", width=480, height=480)
hist(data$Global_active_power, 
     freq=TRUE, col="red", 
     main="Global Active Power", 
     xlab="Gloabal Active Power (kilowatts)"
     )
  
#dev.copy(png, file = "plot1.png")
dev.off()



