
### Set Working Directory to location of household_power_consumption.txt


# Import and Subset only data for  7/1 and 7/2
	pwr <- subset(read.table("household_power_consumption.txt",header= TRUE, sep = ";", na.strings = "?")
		, as.Date(Date, format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date, format="%d/%m/%Y") <= "2007-02-02")

#  Add Column to varialbe pwr with combined date and time
	pwr$datetime <- as.POSIXct(strptime(paste(pwr$Date, pwr$Time), format="%d/%m/%Y %H:%M:%S"))

#Plot 2
	png(filename="plot2.png", width=480, height=480)
	plot(pwr$datetime, pwr$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
	dev.off()