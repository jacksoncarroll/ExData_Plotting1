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

## Open a PNG device and plot the histogram Global Active Power
png("plot1.png", width=480, height=480)

hist(baseData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")

dev.off()
