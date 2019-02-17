setwd("EDA")
setwd("wk1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

 

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

data <- cbind(dateTime, data)

#plot 3

plot(data$dateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$dateTime, data$Sub_metering_2, col = "red")
lines(data$dateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off() 
