## Read in the data file
dat <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Keep only data from period of interest
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
startDate <- as.Date("2007-2-1")
endDate <- as.Date("2007-2-2")
dat <- dat[dat$Date >= startDate & dat$Date <= endDate,]

## Create date and time for x-axis
dt.string <- paste(dat$Date, dat$Time, sep = " ")
datetime <- strptime(dt.string, "%Y-%m-%d %H:%M:%S")

## Plot the histogram to PNG file
png("plot3.png", width = 480, height = 480, bg = "transparent")
plot(datetime, dat$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datetime, dat$Sub_metering_2, type = "l", col = "red")
lines(datetime, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()