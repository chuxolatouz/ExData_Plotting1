#Read data from file
df <- read.table('./data/household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
#Changing type of data.
df$Global_active_power <- suppressWarnings( as.double(df$Global_active_power))
df$Date <- suppressWarnings(as.Date(df$Date, format = "%d/%m/%Y"))
#Create variables to use, border cases of dates and labels
top <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
textMain <- "Global Active Power"
textx <- "Global Active Power (Kilowatts)"
#Subsetting data by Date
test <- subset(df, df$Date >= top & df$Date <= end)
#open Device, Plotting and Turning off device
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = textMain, xlab = textx)
dev.off()
