######################################
##  Course Project 1    Plot4      ###
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


## Convert the sub_metering groups to numeric variables

consumption$Sub_metering_1 <- as.numeric(consumption$Sub_metering_1)
consumption$Sub_metering_2 <- as.numeric(consumption$Sub_metering_2)
consumption$Sub_metering_3 <- as.numeric(consumption$Sub_metering_3)

## Convert variable Global_active_power to numeric type

consumption$Global_active_power<-as.numeric(consumption$Global_active_power)

###################################
###################################

##### Plot 4 #######

library(grDevices) 

################################################

##### arrange 4 plots in one canvas

png(filename="plot4.png", width = 480, height = 480)  ## open a png file device

###################################################################
########### Plotting codes ######################

### arrange 4 plots in one canvas
par(mfrow=c(2,2))

## First plot 

plot(consumption$DateTime, consumption$Global_active_power, type="s", 
     xlab="", ylab="Global Active Power")

## Second plot

plot(consumption$DateTime, consumption$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")

## Third plot

plot(consumption$DateTime, consumption$Sub_metering_1, type="s", 
     xlab="", ylab="Energy sub metering")
lines(consumption$DateTime, consumption$Sub_metering_2, type="s", col="red")
lines(consumption$DateTime, consumption$Sub_metering_3, type="s", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
       col=c("black", "red", "blue"), lty=1, bty="n")

## Fourth plot

plot(consumption$DateTime, consumption$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

##################################################################
##################################################################

dev.off()  ## close the device