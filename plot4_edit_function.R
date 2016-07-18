##################
#                #
#                #
#  Plot4 Code    #
#                #
#                #
##################

### Download and read data into R
plot4 <- function(){
  
  fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Household_electric.zip")
unzip("Household_electric.zip")
HouseholdP <- read.csv("household_power_consumption.txt", sep=";")

### Subsetting and data processing
## Subsetting

HouseholdP_subset = subset(HouseholdP, Date == "1/2/2007" | Date =="2/2/2007")

## Date/Time conversion to datatime
Datetime <- strptime(paste(HouseholdP_subset$Date,HouseholdP_subset$Time),"%d/%m/%Y %H:%M:%S")

## Plot1: Variable
X <- as.numeric(levels(HouseholdP_subset$Global_active_power))[HouseholdP_subset$Global_active_power]
## Plot2: Variable
Voltage <- as.numeric(levels(HouseholdP_subset$Voltage))[HouseholdP_subset$Voltage]
## Plot3: Variable
y0 <- as.numeric(levels(HouseholdP_subset$Global_reactive_power))[HouseholdP_subset$Global_reactive_power]
## Plot4: Variable
y1 <- as.numeric(levels(HouseholdP_subset$Sub_metering_1))[HouseholdP_subset$Sub_metering_1]
y2 <- as.numeric(levels(HouseholdP_subset$Sub_metering_2))[HouseholdP_subset$Sub_metering_2]
y3 <- as.numeric(HouseholdP_subset$Sub_metering_3)
### open graphic device: png
png(file="plot4.png")
### Plotting
## set four grid plot
##windows()
par(mfrow=c(2,2))
## Plot 1
plot(Datetime, X, col="black",type="l", xlab="", ylab="Global Reactive Power (kilowatts)")
## Plot 2
plot(Datetime, Voltage, col="black",type="l", xlab="datetime", ylab="Voltage")
## Plot 3
plot(Datetime, y1, col="black",type="l", xlab="", ylab="Enegy sub metering")
lines(Datetime, y2, col="red")
lines(Datetime, y3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty='y', cex=.75)
## Plot 4
plot(Datetime, y0, col="black",type="l", xlab="datetime", ylab="Global_reactive_power")
## Close graphic device and save
dev.off();
}