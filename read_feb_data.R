read_feb_data <- function() {
    
    febDataFile <- "./feb_household_power_consumption.csv"
    februaryData <- if (!file.exists(febDataFile)) {
        
        # download data if necessary
        zipFile <- "./exdata_data_household_power_consumption.zip"
        if (!file.exists(zipFile)) {
            cat("Downloading data\n")
            url <-
                "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(url, destfile = zipFile, method = "curl")
        }
        
        # read directly from zip file
        data <-
            read.csv(
                unz(zipFile, "household_power_consumption.txt"),
                sep = ";",
                stringsAsFactors = FALSE,
                na.strings = "?"
            )
        data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
        
        startDate <- as.Date("2007-02-01")
        endDate <- as.Date("2007-02-02")
        febData <- data[data$Date >= startDate & data$Date <= endDate,]
        
        write.csv(febData, febDataFile, row.names = FALSE)
        febData
        
    } else {
        febData <- read.csv(febDataFile, stringsAsFactors = FALSE)
        febData$Date <- as.Date(febData$Date)
        febData
    }
    
    februaryData
}
