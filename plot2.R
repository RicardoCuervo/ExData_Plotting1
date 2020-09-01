data_file <- "household_power_consumption.txt"
datos <- read.table(file = data_file,header = TRUE, sep = ";")
fechas <- datos$Date %in% c("1/2/2007","2/2/2007") #solo funciona con caracteres
dataset <- datos[fechas,]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

x <- dataset$Date
y <- dataset$Time
dataset$Date_Time <- paste(x,y)
dataset$Date_Time <- strptime(dataset$Date_Time, "%d/%m/%Y %H:%M:%S", tz="")

with(dataset, plot(Date_Time, Global_active_power, type = "l",
                   ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "plot2.png")
dev.off()