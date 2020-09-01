data_file <- "household_power_consumption.txt"
datos <- read.table(file = data_file,header = TRUE, sep = ";")
fechas <- datos$Date %in% c("1/2/2007","2/2/2007") #solo funciona con caracteres
dataset <- datos[fechas,]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
dataset$Global_reactive_power <- as.numeric(dataset$Global_reactive_power)
dataset$Voltage <- as.numeric(dataset$Voltage)
x <- dataset$Date
y <- dataset$Time
dataset$Date_Time <- paste(x,y)
dataset$Date_Time <- strptime(dataset$Date_Time, "%d/%m/%Y %H:%M:%S", tz="")

par(mfrow=c(2,2))
with(dataset, plot(Date_Time, Global_active_power, type = "l",
                     ylab = "Global Active Power", xlab = ""))
with(dataset, plot(Date_Time, Voltage, type = "l",
                     ylab = "Voltage", xlab = "datetime"))
with(dataset, plot(Date_Time, Sub_metering_1, type = "l", xlab = "",
                   ylab = "Energy sub metering"))
points(dataset$Date_Time, dataset$Sub_metering_2, type = "l", col = "red")
points(dataset$Date_Time, dataset$Sub_metering_3, type = "l", col = "blue")
leyend <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", col = c("black","red","blue"), lwd = 1 ,legend=leyend,
       cex=0.5, bty = "n")
with(dataset, plot(Date_Time, Global_reactive_power, type = "l",
                   ylab = "Global_reactive_power", xlab = "datetime"))
dev.copy(png, file = "plot4.png")
dev.off()