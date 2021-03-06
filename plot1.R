# load entire data file to R
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", check.names = FALSE)
# convert date variable to type date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# Create a time format that reflects the period of data collection
data$completeTime <- as.POSIXct(paste(data$Date, data$Time))
# Subset the data to get data for feb 1 and feb 2 2007
dataSubset <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]
#open png file device
png(file = "plot1.png", width = 480, height = 480)
# create figure
with(dataSubset, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red"))
# Close png file device
dev.off()