##
##  Exploratory Data Analysis
##
##  Course Project 1 - Create Plot 4
##
##  File: Plot4.R
##
##  Author: Sæmundur Melstað
##  Date..: 8.8.2014
##
##  Read datafile
classes = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
consumption <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = classes)
##
##  Filter out selected dates
workingset <- consumption[(consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007"),]
##
##  Convert Date + Time into DateTime field
workingset$Time <- strptime(paste(workingset$Date,workingset$Time),"%d/%m/%Y %H:%M:%S")
##
##  Create and Write plot to file
##
##  Open device
png(filename = "plot4.png",width = 480, height = 480, units = "px")
##
##  Layout 2 x 2
par(mfrow = c(2, 2))
##
##  Create plot-1
with(workingset, plot(Time, Global_active_power,type="l",xlab="", ylab="Global Active Power"))
##
##  Create plot-2
with(workingset, plot(Time, Voltage,type="l",xlab="datetime", ylab="Voltage"))
##
##  Create plot-3
with(workingset, plot(Time, Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"))
with(workingset, lines(Time, Sub_metering_2, col="red"))
with(workingset, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##
##  Create plot-4
with(workingset, plot(Time, Global_reactive_power,type="l",xlab="datetime"))
##
##  Close device
dev.off()