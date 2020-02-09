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
                             stringsAsFactors =FALSE, sep=";", na.strings = "?")%>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = dmy_hms(paste(Date, Time)))%>%
  select(-Time)


## Create Plot 1 - Histogram of global active power
png("plot1.png", width=480, height=480)
hist(consumption_data$Global_active_power, col="red", ylab = "Frequency" 
     , xlab = "Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()

