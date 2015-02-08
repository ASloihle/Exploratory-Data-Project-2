setwd("C:/Users/Aspen_2/Downloads/exdata_data_household_power_consumption")
library(data.table)

powerdata <- fread("household_power_consumption.txt")



powerdata$Date <- as.Date(powerdata$Date, format ="%d/%m/%Y")

powerdata1 <- powerdata[powerdata$Date >= as.Date("01/02/2007", format="%d/%m/%Y"), ]
powerdata1 <- powerdata1[powerdata1$Date < as.Date("03/02/2007", format="%d/%m/%Y"), ]


powerdata1$datetime <- paste(powerdata1$Date, powerdata1$Time)
powerdata1$datetime <- as.POSIXct(powerdata1$datetime)

powerdata1$Sub_metering_1 <- as.numeric(powerdata1$Sub_metering_1)
powerdata1$Sub_metering_2 <- as.numeric(powerdata1$Sub_metering_2)
powerdata1$Global_active_power <- as.numeric(powerdata1$Global_active_power)
powerdata1$Global_reactive_power <- as.numeric(powerdata1$Global_reactive_power)


png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Plot4.png", width = 480, height = 480)

plot.new()
par(mfrow = c(2,2))

plot(powerdata1$Global_active_power, xlab = "", type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at=c(1, (NROW(powerdata1)/2), NROW(powerdata1)), labels=c("Thu", "Fri", "Sat"))

#----------------------------------------------------------


plot(powerdata1$Voltage, xlab = "datetime", type = "l", ylab = "Voltage", xaxt = "n")
axis(1, at=c(1, (NROW(powerdata1)/2), NROW(powerdata1)), labels=c("Thu", "Fri", "Sat"))

#----------------------------------------------------------

plot(powerdata1$Sub_metering_1, type = "l", xlab = "datetime", ylab = "Energy Sub Metering", xaxt = "n")
axis(1, at=c(1, (NROW(powerdata1)/2), NROW(powerdata1)), labels=c("Thu", "Fri", "Sat"))
lines(powerdata1$Sub_metering_2, type = "l", col= "red")
lines(powerdata1$Sub_metering_3, type = "l", col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red","blue"))

#----------------------------------------------------------
plot(powerdata1$Global_reactive_power, xlab = "datetime", type = "l", ylab = "Global Rective Power (kilowatts)", xaxt = "n")
axis(1, at=c(1, (NROW(powerdata1)/2), NROW(powerdata1)), labels=c("Thu", "Fri", "Sat"))

dev.off()


