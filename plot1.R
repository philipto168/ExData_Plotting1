
library(lubridate)

# read data and convert the date format.
b<-read.delim("./household_power_consumption.txt", sep=";")
b$Global_active_power <-as.numeric(b$Global_active_power)
b$Date <- dmy(b$Date)

# Get the subset of data of interest Feb 1, 2007 to Feb 2, 2007.
b<-subset(b,b$Date <= mdy("02/02/2007") & b$Date >= mdy("02/01/2007"))
# Create a column name datetime
b$datetime <- as.POSIXct(strptime(paste(b$Date, b$Time), "%Y-%m-%d %H:%M:%S"))

# Plot on a png file with width 480 and height 480
png("plot1.png", width=480, height=480)
with(b,hist(Global_active_power,xlab = "Global Active Power (kilowatts)",main="Global Active Power",col="Red"))
dev.off()



