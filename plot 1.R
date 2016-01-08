#Read data
data = read.csv("data/household_power_consumption.txt", sep = ";")
select = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Convert Global_active_power into numeric value
GAP = as.numeric(as.character(select$Global_active_power))

#Plot histogram
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Copy figure to PNG device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
