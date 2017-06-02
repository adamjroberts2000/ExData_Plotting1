dataSource <- "C:/Users/adamroberts/Documents/R Programming Assignment/Exploratory Data Analysis Assignment 1/household_power_consumption.txt"
data <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSegment <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(dataSegment$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
library(png)
img <- readPNG('C:/Users/adamroberts/Documents/R Programming Assignment/Exploratory Data Analysis Assignment 1/plot1.png')
grid::grid.raster(img)
