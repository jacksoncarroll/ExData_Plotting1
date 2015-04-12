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

## Open a PNG device and plot the fourth graph
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

## The first graph
plot(baseData$DateTime, baseData$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

## The second graph
plot(baseData$DateTime, baseData$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# The third graph
plot(baseData$DateTime, baseData$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")

lines(baseData$DateTime, baseData$Sub_metering_2, col="red")
lines(baseData$DateTime, baseData$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, box.lwd=0)

# The forth graph
plot(baseData$DateTime, baseData$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(baseData$DateTime, baseData$Global_reactive_power)

dev.off()
