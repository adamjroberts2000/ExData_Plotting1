dataSource <- "C:/Users/adamroberts/Documents/R Programming Assignment/Exploratory Data Analysis Assignment 1/household_power_consumption.txt"
data <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSegment <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dateAndTime <- strptime(paste(dataSegment$Date, dataSegment$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSegment$Global_active_power)
globalReactivePower <- as.numeric(dataSegment$Global_reactive_power)
voltage <- as.numeric(dataSegment$Voltage)
subMetering1 <- as.numeric(dataSegment$Sub_metering_1)
subMetering2 <- as.numeric(dataSegment$Sub_metering_2)
subMetering3 <- as.numeric(dataSegment$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateAndTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateAndTime, subMetering2, type="l", col="red")
lines(dateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateAndTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")