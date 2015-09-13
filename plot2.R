### Exploratory Data Analysis: Course Project 1
### Plot 2

## Read in and format data
hpctempdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpctempdata$Date <- as.Date(hpctempdata$Date, format = "%d/%m/%Y")
hpcdata <- hpctempdata[(hpctempdata$Date == "2007-02-01" | hpctempdata$Date == "2007-02-02"), ]
rm(hpctempdata)
datetime <- paste(hpcdata$Date, hpcdata$Time)
hpcdata$Time <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

## Create Plot 2 File
png(filename = "plot2.png", height = 480, width = 480)
with(hpcdata, plot(Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()