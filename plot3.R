# Read the data. Data is separated by semicolons and contains column names
powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# Convert any blanks labelled as question mark to NA
powerData[powerData == "?"] <- NA

# Convert the date format
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")

# Keep only necessary date range from February 1-2, 2007
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
powerData <- powerData[powerData$Date >= startDate & powerData$Date <= endDate, ]

# Plot 3
png("plot3.png", width = 480, height = 480)

datetimeStrings <- paste(powerData$Date, powerData$Time)
powerData$posix <- strptime(datetimeStrings, format = "%Y-%m-%d %H:%M:%S")

plot(powerData$posix, powerData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(powerData$posix, powerData$Sub_metering_2, type = "l", col = "red")
lines(powerData$posix, powerData$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

# Fix weird x-axis
positions <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))
days <- c("Thu", "Fri", "Sat")
axis(1, at = positions, labels = days)

dev.off()

