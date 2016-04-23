## Reading The complete dataset
completeDataSet <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##format the date
completeDataSet$Date <- as.Date(completeDataSet$Date, format="%d/%m/%Y")

## data subset
data <- subset(completeDataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Creating the png output file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()