# Read the data
fn <- "household_power_consumption.txt"
data <- read.csv(fn, sep=";", na.strings = "?", colClasses = c(rep("character",2), rep("numeric", 7)))

# Convert formar of the Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# select data from 2007-02-01 to 2007-02-02
dataSub <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
dataSub$Global_active_power = as.numeric(as.character(dataSub$Global_active_power))

# Draw the plot and save it on PNG
png(filename="plot2.png", width=480, height=480, bg="transparent")
plot(dataSub$Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowats)",xlab="")
axis(1, at=c(1, as.integer(nrow(dataSub)/2), nrow(dataSub)), labels=c("Thu", "Fri", "Sat"))
dev.off()
