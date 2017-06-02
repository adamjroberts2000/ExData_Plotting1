dataSource <- "C:/Users/adamroberts/Documents/R Programming Assignment/Exploratory Data Analysis Assignment 1/household_power_consumption.txt"
data <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSegment <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dateAndTime <- strptime(paste(dataSegment$Date, dataSegment$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSegment$Global_active_power)
subMetering1 <- as.numeric(dataSegment$Sub_metering_1)
subMetering2 <- as.numeric(dataSegment$Sub_metering_2)
subMetering3 <- as.numeric(dataSegment$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateAndTime, subMetering2, type="l", col="red")
lines(dateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
