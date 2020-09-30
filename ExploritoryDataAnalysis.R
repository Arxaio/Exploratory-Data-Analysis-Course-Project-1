# Reading data 
powercons <- read.csv("household_power_consumption.txt", sep = ";")

# Changing to class from character to numeric, time or date  
powercons$Date <- as.Date(powercons$Date, format="%d/%m/%Y")
powercons$Time <- strptime(powercons$Time) #still need to work on this
powercons$DateTime <- strptime(paste(powercons$Date, powercons$Time), format = "%Y-%m-%d %H:%M:%S")
powercons$Global_active_power <- as.numeric(powercons$Global_active_power)
powercons$Global_reactive_power <- as.numeric(powercons$Global_reactive_power)
powercons$Voltage <- as.numeric(powercons$Voltage)
powercons$Global_intensity <- as.numeric(powercons$Global_intensity)
powercons$Sub_metering_1 <- as.numeric(powercons$Sub_metering_1)
powercons$Sub_metering_2 <- as.numeric(powercons$Sub_metering_2)
powercons$Sub_metering_3 <- as.numeric(powercons$Sub_metering_3)

# Selecting right dates
power <- powercons[powercons$Date >= "2007-2-1" & powercons$Date <= "2007-2-2",]

# Plot graph 1
hist(power$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot1.png")
dev.off()

# Plot graph 2
with(power, plot(DateTime, Global_active_power, 
                 ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))
dev.copy(png, file = "Plot2.png")
dev.off()

# Plot graph 3
with(power, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(power, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(power, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", " Sub_metering_3"))
dev.copy(png, file = "Plot3.png")
dev.off()

# Plot graph 4
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
## Plot part 1
with(power, plot(DateTime, Global_active_power, ylab = "Global Active Power", 
                 xlab = "", type = "l", cex.lab = 0.75, cex.axis = 0.75))
## Plot part 2
with(power, plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", 
                 type = "l", cex.lab = 0.75, cex.axis = 0.75))

## Plot part 3
with(power, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", 
                 xlab = "", type = "l", cex.lab = 0.75, cex.axis = 0.75))
with(power, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(power, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", " Sub_metering_3"), cex = 0.5)

## Plot part 4
with(power, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", 
                 type = "l", cex.lab = 0.75, cex.axis = 0.75))

## Save plot as png
dev.copy(png, file = "Plot4.png")
dev.off()




