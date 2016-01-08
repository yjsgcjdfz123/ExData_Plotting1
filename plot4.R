#Read data
data = read.csv("data/household_power_consumption.txt", sep = ";")
select = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Convert Sub_metering data into numeric value
SUB1 = as.numeric(as.character(select$Sub_metering_1))
SUB2 = as.numeric(as.character(select$Sub_metering_2))
SUB3 = as.numeric(as.character(select$Sub_metering_3))

#Convert Global_active_power into numeric value
GAP = as.numeric(as.character(select$Global_active_power))

#Convert Voltage into numeric value
VOL = as.numeric(as.character(select$Voltage))

#Convert Global_reactive_power into numeric value
GRP = as.numeric(as.character(select$Global_reactive_power))

#Convert Time into date type value
Time = strptime(paste(as.character(select$Date), as.character(select$Time), sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Plot figure and labelling
#Set plot parameter
par(mfrow = c(2, 2))

#Plot Global Active Power ~ Time
plot(Time, GAP, type = "l", xaxt = "n", xlab = NA, ylab = "Global Active Power (kilowatts)")
axis.POSIXct(side = 1, at = c(Time[1], Time[1440], Time[2880]), labels = c("Thu", "Fri", "Sat"))

#Plot Voltage ~ Time
plot(Time, VOL, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis.POSIXct(side = 1, at = c(Time[1], Time[1440], Time[2880]), labels = c("Thu", "Fri", "Sat"))

#Plot Energy sub metering ~ Time
plot(Time, SUB1, col = "black", type = "l", xaxt = "n", xlab = NA, ylab = "Energy sub metering")
axis.POSIXct(side = 1, at = c(Time[1], Time[1440], Time[2880]), labels = c("Thu", "Fri", "Sat"))
lines(Time, SUB2, col = "red")
lines(Time, SUB3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.25, bty = "n")

#Plot Voltage ~ Time
plot(Time, GRP, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis.POSIXct(side = 1, at = c(Time[1], Time[1440], Time[2880]), labels = c("Thu", "Fri", "Sat"))

#Copy figure to PNG device
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
