###Exploratory Data Analysis: Course Project 1
### Plot 1

## Read in and format data
hpctempdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpctempdata$Date <- as.Date(hpctempdata$Date, format = "%d/%m/%Y")
hpcdata <- hpctempdata[(hpctempdata$Date == "2007-02-01" | hpctempdata$Date == "2007-02-02"), ]
rm(hpctempdata)
datetime <- paste(hpcdata$Date, hpcdata$Time)
hpcdata$Time <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

## Create Plot 1 File
png(filename = "plot1.png", height = 480, width = 480)
hist(hpcdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()