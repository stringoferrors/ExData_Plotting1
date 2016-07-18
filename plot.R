##################
#                #
#                #
#  Plot1 Code    #
#                #
#                #
##################

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "Household_electric.zip")
unzip("Household_electric.zip")
HouseholdP <- read.csv("household_power_consumption.txt", sep=";")


HouseholdP_subset = subset(HouseholdP, Date == "1/3/2007" | Date =="2/3/2007")
X <- as.numeric(levels(HouseholdP_subset$Global_active_power))[HouseholdP_subset$Global_active_power]

##png(file="plotA.png")
windows()
hist(X, col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")
#dev.off()