# load entire data file to R
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", check.names = FALSE)
# convert date variable to type date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# Create a time format that reflects the period of data collection
data$completeTime <- as.POSIXct(paste(data$Date, data$Time))
# Subset the data to get data for feb 1 and feb 2 2007
dataSubset <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
# Open png file device
png(file = "plot3.png", width = 480, height = 480)
# Initialise plot
with(dataSubset, {
plot(Sub_metering_1 ~ completeTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Add red lines to represent sub metering 2
lines(Sub_metering_2 ~ completeTime, col = "red")
# add blue lines to represent sub metering 3
lines(Sub_metering_3 ~ completeTime, col = "blue")
})
# Add legend to graph
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()