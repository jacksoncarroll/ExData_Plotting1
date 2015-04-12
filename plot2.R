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

## Open a PNG device and plot the second graph
png("plot2.png", width=480, height=480)

plot(baseData$DateTime, baseData$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
