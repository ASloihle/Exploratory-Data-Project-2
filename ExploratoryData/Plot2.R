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
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Plot2.png", width = 480, height = 480)
plot(powerdata1$Global_active_power, xlab = "", type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at=c(1, (NROW(powerdata1)/2), NROW(powerdata1)), labels=c("Thu", "Fri", "Sat"))
dev.off()