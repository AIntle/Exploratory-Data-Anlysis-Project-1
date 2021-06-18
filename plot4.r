
### Set Working Directory to location of household_power_consumption.txt


# Import and Subset only data for  7/1 and 7/2
	pwr <- subset(read.table("household_power_consumption.txt",header= TRUE, sep = ";", na.strings = "?")
		, as.Date(Date, format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date, format="%d/%m/%Y") <= "2007-02-02")

#  Add Column to varialbe pwr with combined date and time
	pwr$datetime <- as.POSIXct(strptime(paste(pwr$Date, pwr$Time), format="%d/%m/%Y %H:%M:%S"))

#Plot 4
	png(filename="plot4.png", width=480, height=480)
	par(mfrow=c(2,2), mar=c(4,4,2,1))

	plot(pwr$datetime, pwr$Global_active_power, type="l", ylab="Global Active Power", xlab="")
	
	plot(pwr$datetime, pwr$Voltage, xlab="datetime",ylab="Voltage", type="l")
	
	plot(pwr$datetime, pwr$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab="")
	lines(pwr$datetime, pwr$Sub_metering_2, type = "l", col = "red")
	lines(pwr$datetime, pwr$Sub_metering_3, type = "l", col = "blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

	plot(pwr$datetime, pwr$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

	dev.off()
