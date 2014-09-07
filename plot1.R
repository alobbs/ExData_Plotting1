# Read the data
fn <- "household_power_consumption.txt"
data <- read.csv(fn, sep=";", na.strings = "?", colClasses = c(rep("character",2), rep("numeric", 7)))

# Convert formar of the Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# select data from 2007-02-01 to 2007-02-02
dataSub <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

# Draw the plot and save it on PNG
png(filename="plot1.png", width=480, height=480, bg="transparent")
hist(as.numeric(dataSub$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
