setwd("EDA")
setwd("wk1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# 
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

data <- cbind(dateTime, data)

# plot 1
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
