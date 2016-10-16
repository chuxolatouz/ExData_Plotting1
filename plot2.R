#Read data from file
df <- read.table('./data/household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
#Changing type of data.
df$Global_active_power <- suppressWarnings( as.double(df$Global_active_power))
df$Date <- suppressWarnings(as.Date(df$Date, format = "%d/%m/%Y"))
#Create variables to use, border cases of dates and labels
top <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
textx <- "Global Active Power (Kilowatts)"
#Subsetting data by Date
test <- subset(df, df$Date >= top & df$Date <= end)
#Creating new col posix data type with Date and Time
test$posix <- paste(test$Date, test$Time, sep = " ")
test$posix <- as.POSIXct(strptime( test$posix, format = "%Y-%m-%d %H:%M:%S"))
#open Device, Plotting and Turning off device
png("plot2.png", width = 480, height = 480)
plot(test$posix, test$Global_active_power, type = "l", ylab = textx, xlab=" ")
dev.off()
