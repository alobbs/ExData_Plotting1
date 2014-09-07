# Read the data
fn <- "household_power_consumption.txt"
data <- read.csv(fn, sep=";", na.strings = "?", colClasses = c(rep("character",2), rep("numeric", 7)))

# Convert formar of the Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# select data from 2007-02-01 to 2007-02-02
dataSub <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
dataSub$Global_active_power = as.numeric(as.character(dataSub$Global_active_power))

# Draw the plot and save it on PNG
png(filename="plot4.png", width=480, height=480, bg="transparent")
par(mfrow=c(2,2))

# 1st graph
plot(dataSub$Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowats)",xlab="")
axis(1, at=c(1, as.integer(nrow(dataSub)/2), nrow(dataSub)), labels=c("Thu", "Fri", "Sat"))

# 2nd
plot(dataSub$Voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(dataSub)/2), nrow(dataSub)), labels=c("Thu", "Fri", "Sat"))

# 3rd
with(dataSub, {
    plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
    lines(x=Sub_metering_2, col="red")
    lines(x=Sub_metering_3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(dataSub)/2), nrow(dataSub)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

# 4th
plot(dataSub$Global_reactive_power, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(dataSub)/2), nrow(dataSub)), labels=c("Thu", "Fri", "Sat"))

dev.off()
