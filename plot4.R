#Read data from file
df <- read.table('./data/household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
#Changing type of data
df$Global_intensity <- suppressWarnings( as.double(df$Global_intensity))
df$Global_active_power <- suppressWarnings( as.double(df$Global_active_power))
df$Global_reactive_power <- suppressWarnings( as.double(df$Global_reactive_power))
df$Voltage <- suppressWarnings( as.double(df$Voltage))
df$Sub_metering_1 <- suppressWarnings( as.double(df$Sub_metering_1))
df$Sub_metering_2 <- suppressWarnings( as.double(df$Sub_metering_2))
df$Date <- suppressWarnings(as.Date(df$Date, format = "%d/%m/%Y"))
#Creating variables and vectors to use
top <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
textx <- "Global Active Power (Kilowatts)"
textd <- "datetime"
textr <- "Global_reactive_power"
test <- subset(df, df$Date >= top & df$Date <= end)
test$posix <- paste(test$Date, test$Time, sep = " ")
test$posix <- as.POSIXct(strptime( test$posix, format = "%Y-%m-%d %H:%M:%S"))
#open Device

png("plot4.png", width = 480, height = 480)
#Divide device in 2 columns and 2 rows
par(mfcol = c(2,2))
#Plot1
plot(test$posix, test$Global_active_power, type = "l", ylab = textx, xlab = " ")
#Plot2 with lines extras and legend
plot(test$posix, test$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(test$posix, test$Sub_metering_2, col = "red")
lines(test$posix, test$Sub_metering_3, col = "blue")
legend("topright", col = colors, legend = legends, lty = 1, lwd = 2)
#Plot3 
plot(test$posix, test$Voltage, type = "l", xlab = textd, ylab = "Voltage")
#Plot4
plot(test$posix, test$Global_reactive_power, type = "l", xlab = textd, ylab = textr)
#Turning off device
dev.off()
