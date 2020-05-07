source("read_feb_data.R")

fd <- read_feb_data()
fd$DateTime <- strptime(paste(fd$Date, fd$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par("mfrow" = c(2, 2))

plot(fd$DateTime, fd$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)

plot(fd$DateTime, fd$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage"
)

plot(fd$DateTime, fd$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
)
lines(fd$DateTime, fd$Sub_metering_2, col = "red")
lines(fd$DateTime, fd$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(rep("solid", 3)),
       bty = "n"
)

plot(fd$DateTime, fd$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power"
)

dev.off()

