dataSource <- "C:/Users/adamroberts/Documents/R Programming Assignment/Exploratory Data Analysis Assignment 1/household_power_consumption.txt"
data <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSegment <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dateAndTime <- strptime(paste(dataSegment$Date, dataSegment$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSegment$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")