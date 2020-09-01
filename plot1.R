data_file <- "household_power_consumption.txt"
datos <- read.table(file = data_file,header = TRUE, sep = ";")
fechas <- datos$Date %in% c("1/2/2007","2/2/2007") #solo funciona con caracteres 
dataset <- datos[fechas,]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)
with(dataset, hist(Global_active_power, col = "red",
           main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()
