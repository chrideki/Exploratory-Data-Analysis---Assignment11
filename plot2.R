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
plot(newdata$Global_active_power ~ newdata$DateTime, type = "l", xlab="", ylab = "Global Active Power (Kilowatts)")
## create png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

