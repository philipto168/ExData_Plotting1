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
png("plot3.png", width=480, height=480)
plot(b$datetime, b$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines(b$datetime, b$Sub_metering_1)
lines(b$datetime, b$Sub_metering_2, col="Red")
lines(b$datetime, b$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()


