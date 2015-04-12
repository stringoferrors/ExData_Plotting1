##################
#                #
#                #
#  Plot2 Code    #
#                #
#                #
##################

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Household_electric.zip")
unzip("Household_electric.zip")
HouseholdP <- read.csv("household_power_consumption.txt", sep=";")


HouseholdP_subset = subset(HouseholdP, Date == "1/2/2007" | Date =="2/2/2007")
X <- as.numeric(levels(HouseholdP_subset$Global_active_power))[HouseholdP_subset$Global_active_power]
Datetime <- strptime(paste(HouseholdP_subset$Date,HouseholdP_subset$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
plot(Datetime, X, col="black",type="l", xlab="", ylab="Global Reactive Power (kilowatts)")
dev.off();