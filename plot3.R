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
png("plot3.png")
plot(1:2880, hhpowerconsumption$Sub_metering_1, type = "s",
     ylab = "Energy sub metering", xlab = "")
with(subset(hhpowerconsumption, select = "Sub_metering_2"), 
     points(1:2880, Sub_metering_2, col = "red", type = "s"))
with(subset(hhpowerconsumption, select = "Sub_metering_3"), 
     points(1:2880, Sub_metering_3, col = "blue", type = "s"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()