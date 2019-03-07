library(dplyr)
## read data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
## subset data
newdata <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
## convert class of Date
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")
## add new coloumn merging date and time, change class of new coloumn
newdata <- mutate(newdata, DateTime = as.POSIXct(paste(newdata$Date, newdata$Time)))
## plot data
par(mfrow = c(2,2), mar = c(4,4,2,1))
plot(newdata$Global_active_power ~ newdata$DateTime, type = "l", xlab="", ylab = "Global Active Power")
plot(newdata$Voltage ~ newdata$DateTime, type = "l", xlab="datetime", ylab = "Voltage")
plot(newdata$Sub_metering_1 ~ newdata$DateTime, type = "l", xlab="", ylab = "Energy sub metering")
lines(newdata$Sub_metering_2 ~ newdata$DateTime, type = "l", col = "red")
lines(newdata$Sub_metering_3 ~ newdata$DateTime, type = "l", col = "blue")
legend("topright", bty = "n", lty = 2, lwd = 0, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.32)
plot(newdata$Global_reactive_power ~ newdata$DateTime, type = "l", xlab="datetime")
## create png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

