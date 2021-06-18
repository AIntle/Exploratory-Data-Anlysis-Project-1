### Set Working Directory to location of household_power_consumption.txt


# Import and Subset only data for  7/1 and 7/2
	pwr <- subset(read.table("household_power_consumption.txt",header= TRUE, sep = ";", na.strings = "?")
		, as.Date(Date, format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date, format="%d/%m/%Y") <= "2007-02-02")

#  Add Column to varialbe pwr with combined date and time
	pwr$datetime <- as.POSIXct(strptime(paste(pwr$Date, pwr$Time), format="%d/%m/%Y %H:%M:%S"))

#Plot 1
	png(filename="plot1.png", width=480, height=480)
	hist(pwr$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
	dev.off()
