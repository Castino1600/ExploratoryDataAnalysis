######################################
##  Course Project 1    Plot2      ###
######################################

##################################################

##### Read dataset ########

setwd("C:/Users/128267/Desktop/Learning and Research/MOOCS/Data Science Specialization/Exploratory Data Analysis")

consumptionDat <- read.table("household_power_consumption.txt", sep=";", header=T, 
                             stringsAsFactors = F)


### Covert the dates to standard dates format 

consumptionDat$newDate <- as.Date(consumptionDat$Date, format="%d/%m/%Y")

### Subset the data only to the dates 2007-02-01 and 2007-02-02  ###

consumption <- subset(consumptionDat, consumptionDat$newDate =="2007-02-01"| consumptionDat$newDate =="2007-02-02")

## convert the Date and Time variables to Date/Time classes ###
## 1) create a new variable combining Date and Time together

consumption$DateTime <- paste(consumption$Date, consumption$Time, sep=" ")

## 2) use strptime function to format the Datetime variable

consumption$DateTime <- strptime(consumption$DateTime, format="%d/%m/%Y %H:%M:%S")


consumption$DT <- as.Date(consumption$DateTime)


class(consumption$DateTime)

###################################
###################################

##### Plot1 #######

library(grDevices) 

## Convert variable Global_active_power to numeric type

consumption$Global_active_power<-as.numeric(consumption$Global_active_power)

################################################

png(filename="plot2.png", width = 480, height = 480)  ## open a png file device

plot(consumption$DateTime, consumption$Global_active_power, type="s", 
      xlab="", ylab="Global Active Power (kilowatts)")

dev.off()  ## close the device













