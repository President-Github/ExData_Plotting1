## Exploratory Data Analysis Week 1 Assignment
## Coursera Data Science
## Morgan Meeuwissen February 2020

## Setup
setwd("~/Coding-Repositries/R/Coursera/ExploratoryDataAnalysis/Week1Assignment/")
require(dplyr)
require(ggplot2)
require(lubridate)


## Load data and subset
consumption_data<-read.table("household_power_consumption.txt", header = TRUE,
                             stringsAsFactors =FALSE, sep=";", na.strings = "?",
                             colClasses = c("character","character", rep("numeric",7)))%>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = dmy_hms(paste(Date, Time)))%>%
  select(-Time)


## Create Plot 2 - Graph of Global Active Power over Time
png("plot2.png", width=480, height=480)
plot(consumption_data$Date,consumption_data$Global_active_power,
      ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()

