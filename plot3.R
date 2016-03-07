#Set working directory
setwd("C:/Users/deschmidt/Desktop/Exploratory Data Analysis")
filePath <- "./data/household_power_consumption.txt"

#Read in column names
columns <- read.table(filePath, sep = ";", na.strings = "?", nrows = 1, stringsAsFactors = FALSE) 

#Read in only rows from the desired dates
myData <- read.table(filePath, sep = ";", col.names = columns, na.strings = "?", nrows = 2880, skip = 66637, stringsAsFactors = FALSE)

#View the structure of the data
str(myData)

#Create timestamp using strptime
timestamp <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Change variables to numeric
globalActivePower <- as.numeric(myData$Global_active_power)
subMetering1 <- as.numeric(myData$Sub_metering_1)
subMetering2 <- as.numeric(myData$Sub_metering_2)
subMetering3 <- as.numeric(myData$Sub_metering_3)

#Plot Energy Sub Metering over time
png("plot3.png", width=480, height=480)
plot(timestamp, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(timestamp, subMetering2, type="l", col="red")
lines(timestamp, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()