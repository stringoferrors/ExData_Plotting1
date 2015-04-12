##################
#                #
#                #
#  Plot3 Code    #
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
y1 <- as.numeric(levels(HouseholdP_subset$Sub_metering_1))[HouseholdP_subset$Sub_metering_1]
y2 <- as.numeric(levels(HouseholdP_subset$Sub_metering_2))[HouseholdP_subset$Sub_metering_2]
y3 <- as.numeric(HouseholdP_subset$Sub_metering_3)


png(file="plot3.png")
plot(Datetime, y1, col="black",type="l", xlab="", ylab="Enegy sub metering")
lines(Datetime, y2, col="red")
lines(Datetime, y3, col="blue")

legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty='y', cex=.75)

dev.off()