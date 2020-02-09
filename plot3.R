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


## Create Plot 3 - Graph of Sub metering readings over Time
png("plot3.png", width=480, height=480)
plot(consumption_data$Date,consumption_data$Sub_metering_1,
      ylab="Energy sub metering", xlab="", type="l")
lines(consumption_data$Date,consumption_data$Sub_metering_2, col="red")
lines(consumption_data$Date,consumption_data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_3", "Sub_metering_3", "Sub_metering_3"),
       col = c("black","red","blue"), lty=1)
dev.off()

