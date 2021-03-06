library(lubridate)

# read data and convert the date format.
b<-read.table("./household_power_consumption.txt",  header = TRUE,sep=";",na.string="?")
b$Global_active_power <-as.numeric(b$Global_active_power)
b$Date <- dmy(b$Date)

# Get the subset of data of interest Feb 1, 2007 to Feb 2, 2007.
b<-subset(b,b$Date <= mdy("02/02/2007") & b$Date >= mdy("02/01/2007"))
# Create a column name datetime
b$datetime <- as.POSIXct(strptime(paste(b$Date, b$Time), "%Y-%m-%d %H:%M:%S"))

# Plot on a png file with width 480 and height 480
png("plot2.png", width=480, height=480)
plot(b$datetime,b$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="")
lines(b$datetime,b$Global_active_power)
dev.off()

