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

# Plot 2
png("plot2.png", width = 480, height = 480)

datetimeStrings <- paste(powerData$Date, powerData$Time)
powerData$posix <- strptime(datetimeStrings, format = "%Y-%m-%d %H:%M:%S")

plot(powerData$posix, powerData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

positions <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))

days <- c("Thu", "Fri", "Sat")
axis(1, at = positions, labels = days)

dev.off()