#Read data from file
df <- read.table('./data/household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
#Changing type of data
df$Sub_metering_1 <- suppressWarnings( as.double(df$Sub_metering_1))
df$Sub_metering_2 <- suppressWarnings( as.double(df$Sub_metering_2))
df$Date <- suppressWarnings(as.Date(df$Date, format = "%d/%m/%Y"))
#Creating variables and vectors to use
top <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
legends <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
test <- subset(df, df$Date >= top & df$Date <= end)
test$posix <- paste(test$Date, test$Time, sep = " ")
test$posix <- as.POSIXct(strptime( test$posix, format = "%Y-%m-%d %H:%M:%S"))
#open Device, Plotting, adding lines and legend. Turning off device
png("plot3.png", width=480, height = 480)
plot(test$posix, test$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(test$posix, test$Sub_metering_2, col = "red")
lines(test$posix, test$Sub_metering_3, col = "blue")
legend("topright", col = colors, legend = legends, lty = 1, lwd = 2)
dev.off()
