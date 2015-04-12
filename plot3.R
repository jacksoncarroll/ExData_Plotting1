## Read the dataset
baseData <- read.table("household_power_consumption.txt", header=TRUE, 
                       sep=";", colClasses=c("character", "character", 
                                             rep("numeric", 7)), 
                       na.strings="?")

## Convert the Date column
baseData$Date <- as.Date(baseData$Date, format="%d/%m/%Y")

## Subset the data frame to only include the specified dates
baseData <- baseData[baseData$Date >= as.Date("2007-02-01") & 
                             baseData$Date<=as.Date("2007-02-02"),]

## Create a DateTime column
baseData$DateTime <- as.POSIXlt(paste(as.Date(baseData$Date, format="%d/%m/%Y"), baseData$Time, sep=" "))

## Open a PNG device and plot the third graph
png("plot3.png", width=480, height=480)

plot(baseData$DateTime, baseData$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")

lines(baseData$DateTime, baseData$Sub_metering_2, col="red")
lines(baseData$DateTime, baseData$Sub_metering_3, col="blue")

legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()
