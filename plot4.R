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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(b$datetime,b$Global_active_power, type="n",ylab="Global Active Power", xlab="")
lines(b$datetime,b$Global_active_power)
plot(b$datetime,b$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(b$datetime,b$Voltage)
plot(b$datetime, b$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines(b$datetime, b$Sub_metering_1)
lines(b$datetime, b$Sub_metering_2, col="Red")
lines(b$datetime, b$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(b$datetime,b$Global_reactive_power,ylab="global_reactive_power",xlab="datetime",type="n")
lines(b$datetime,b$Global_reactive_power)
points(b$datetime,b$Global_reactive_power,pch=19)
dev.off()


