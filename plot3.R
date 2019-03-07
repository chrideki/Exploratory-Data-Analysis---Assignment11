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
plot(newdata$Sub_metering_1 ~ newdata$DateTime, type = "l", xlab="", ylab = "Energy sub metering")
lines(newdata$Sub_metering_2 ~ newdata$DateTime, type = "l", col = "red")
lines(newdata$Sub_metering_3 ~ newdata$DateTime, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
## create png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

