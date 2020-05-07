source("read_feb_data.R")

fd <- read_feb_data()

fd$DateTime <- strptime(paste(fd$Date, fd$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
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
       lty = c(rep("solid", 3))
       )
dev.off()
