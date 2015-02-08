setwd("C:/Users/Aspen_2/Downloads/exdata_data_household_power_consumption")
library(data.table)

powerdata <- fread("household_power_consumption.txt")



powerdata$Date <- as.Date(powerdata$Date, format ="%d/%m/%Y")

powerdata1 <- powerdata[powerdata$Date >= as.Date("01/02/2007", format="%d/%m/%Y"), ]
powerdata1 <- powerdata1[powerdata1$Date < as.Date("03/02/2007", format="%d/%m/%Y"), ]



powerdata1$datetime <- paste(powerdata1$Date, powerdata1$Time)
powerdata1$datetime <- as.POSIXct(powerdata1$datetime)

powerdata1$Global_active_power <- as.numeric(powerdata1$Global_active_power)


plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Plot3.png", width = 480, height = 480)
plot(powerdata1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", xaxt = "n")
axis(1, at=c(1, (NROW(powerdata1)/2), NROW(powerdata1)), labels=c("Thu", "Fri", "Sat"))
lines(powerdata1$Sub_metering_2, type = "l", col= "red")
lines(powerdata1$Sub_metering_3, type = "l", col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red","blue"))
dev.off()
