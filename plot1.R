



# Read the data. Data is separated by semicolons and contains column names
powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, colClasses)

# Convert any blanks labelled as question mark to NA
powerData[powerData == "?"] <- NA

# Convert the date format
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")

# Keep only necessary date range from February 1-2, 2007
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
powerData <- powerData[powerData$Date >= startDate & powerData$Date <= endDate, ]

# Convert data to numeric
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts")

dev.off()
