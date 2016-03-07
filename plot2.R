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

#Plot Global Active Power over time
globalActivePower <- as.numeric(myData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(timestamp, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()