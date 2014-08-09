##
##  Exploratory Data Analysis
##
##  Course Project 1 - Create Plot 1
##
##  File: Plot1.R
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
##  Create and Write plot to file
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(workingset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()