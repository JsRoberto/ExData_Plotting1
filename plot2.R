zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipUrl, "exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")

hhpowerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                                 colClasses = c("character", "character", "character", "character",
                                                "character", "character", "character", "character",
                                                "character"))
dataFormat <- "%d/%m/%Y"
hhpowerconsumption$Date <- as.Date(hhpowerconsumption$Date, dataFormat)
hhpowerconsumption <- hhpowerconsumption[66637:69516,]
hhpowerconsumption$Global_active_power[hhpowerconsumption$Global_active_power == "?"] <- NA
hhpowerconsumption$Global_reactive_power[hhpowerconsumption$Global_reactive_power == "?"] <- NA
png("plot2.png")
plot(1:2880, hhpowerconsumption$Global_active_power, type = "s",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()