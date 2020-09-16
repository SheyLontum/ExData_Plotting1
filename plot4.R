# load entire data file to R
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", check.names = FALSE)
# convert date variable to type date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# Create a time format that reflects the period of data collection
data$completeTime <- as.POSIXct(paste(data$Date, data$Time))
# Subset the data to get data for feb 1 and feb 2 2007
dataSubset <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
# Open png file device
png(file = "plot4.png", width = 480, height = 480)
# Set global parameters for graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataSubset, {
# Plot of global active power and time
plot(Global_active_power ~ completeTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Plot of voltage and time
plot(Voltage ~ completeTime, type = "l", ylab = "Voltage (volt)", xlab = "")
# plot of sub metering 1 and time
plot(Sub_metering_1 ~ completeTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Add a line to represent sub metering 2
lines(Sub_metering_2 ~ completeTime, col = "red")
# add a blue line to represent sub metering 3
lines(Sub_metering_3 ~ completeTime, col = "blue")
# add legend to graph of sub metering
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Plot of global reactive power and time
plot(Global_reactive_power ~ completeTime, type = "l", ylab = "Global Rective Power (kilowatts)", xlab = "")
})
dev.off()