##
##  Exploratory Data Analysis
##
##  Course Project 1 - Create Plot 2
##
##  File: Plot2.R
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
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(workingset$Time,workingset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


