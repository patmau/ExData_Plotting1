source("read_feb_data.R")

fd <- read_feb_data()

fd$DateTime <- strptime(paste(fd$Date, fd$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(fd$DateTime, fd$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     )
dev.off()
