### Exploratory Data Analysis: Course Project 1
### Plot 3

## Read in and format data
hpctempdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpctempdata$Date <- as.Date(hpctempdata$Date, format = "%d/%m/%Y")
hpcdata <- hpctempdata[(hpctempdata$Date == "2007-02-01" | hpctempdata$Date == "2007-02-02"), ]
rm(hpctempdata)
datetime <- paste(hpcdata$Date, hpcdata$Time)
hpcdata$Time <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

## Create Plot 3 File
png(filename = "plot3.png", height = 480, width = 480)
with(hpcdata, plot(Time,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpcdata, lines(Time,Sub_metering_2, col = "red"))
with(hpcdata, lines(Time,Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = "solid")
dev.off()