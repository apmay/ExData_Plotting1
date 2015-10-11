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
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(datetime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()