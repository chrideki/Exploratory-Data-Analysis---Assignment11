library(dplyr)
## read data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
## subset data
newdata <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
## convert class of Date
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")
## plot data
hist(newdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
## create png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

