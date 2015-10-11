## Read in the data file
dat <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Keep only data from period of interest
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
startDate <- as.Date("2007-2-1")
endDate <- as.Date("2007-2-2")
dat <- dat[dat$Date >= startDate & dat$Date <= endDate,]

## Plot the histogram to PNG file
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()