## Exploratory Data Analysis Week 1 Assignment
## Coursera Data Science
## Morgan Meeuwissen February 2020

## Setup
setwd("~/Coding-Repositries/R/Coursera/ExploratoryDataAnalysis/Week1Assignment/")
require(dplyr)
require(lubridate)


## Load data and subset
consumption_data<-read.table("household_power_consumption.txt", header = TRUE,
                             stringsAsFactors =FALSE, sep=";", na.strings = "?",
                             colClasses = c("character","character", rep("numeric",7)))%>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = dmy_hms(paste(Date, Time)))%>%
  select(-Time)


## Create Plot 4 - Tiles of several graphs
png("plot4.png", width=480, height=480)
layout(matrix(1:4, ncol=2))


# First Tile - Copied From Plot2.R
plot(consumption_data$Date,consumption_data$Global_active_power,
     ylab="Global Active Power", xlab="", type="l")

# Second Tile - Copied From Plot3.R
plot(consumption_data$Date,consumption_data$Sub_metering_1,
     ylab="Energy sub metering", xlab="", type="l")
lines(consumption_data$Date,consumption_data$Sub_metering_2, col="red")
lines(consumption_data$Date,consumption_data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_3", "Sub_metering_3", "Sub_metering_3"),
       col = c("black","red","blue"), lty=1)

# Third Tile
plot(consumption_data$Date,consumption_data$Voltage, type="l",
     xlab = "datetime", ylab="Voltage")

# Fourth Tile
plot(consumption_data$Date,consumption_data$Global_reactive_power, type="l",
     xlab = "datetime", ylab="Global_reactive_power")


dev.off()

