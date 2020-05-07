source("read_feb_data.R")

fd <- read_feb_data()

png(filename = "plot1.png", width = 480, height = 480)
hist(fd$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200)
     )
dev.off()

