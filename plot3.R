##
##  Exploratory Data Analysis
##
##  Course Project 1 - Create Plot 3
##
##  File: Plot3.R
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
##  Convert Date + Time into Time field
workingset$Time <- strptime(paste(workingset$Date,workingset$Time),"%d/%m/%Y %H:%M:%S")
##
##  Create and Write plot to file
png(filename = "plot3.png",width = 480, height = 480, units = "px")
with(workingset, plot(Time, Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"))
with(workingset, lines(Time, Sub_metering_2, col="red"))
with(workingset, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()