#Read data
data = read.csv("data/household_power_consumption.txt", sep = ";")
select = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Convert Global_active_power into numeric value
GAP = as.numeric(as.character(select$Global_active_power))

#Convert Time into date type value
Time = strptime(paste(as.character(select$Date), as.character(select$Time), sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Plot figure and labelling
plot(Time, GAP, type = "l", xaxt = "n", xlab = NA, ylab = "Global Active Power (kilowatts)")
axis.POSIXct(side = 1, at = c(Time[1], Time[1440], Time[2880]), labels = c("Thu", "Fri", "Sat"))

#Copy figure to PNG device
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
