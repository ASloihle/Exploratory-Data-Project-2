setwd("C:/Users/Aspen_2/Downloads/exdata_data_household_power_consumption")
library(data.table)

powerdata <- fread("household_power_consumption.txt")



powerdata$Date <- as.Date(powerdata$Date, format ="%d/%m/%Y")

powerdata1 <- powerdata[powerdata$Date >= as.Date("01/02/2007", format="%d/%m/%Y"), ]
powerdata1 <- powerdata1[powerdata1$Date < as.Date("03/02/2007", format="%d/%m/%Y"), ]


powerdata1$Global_active_power <- as.numeric(powerdata1$Global_active_power)


plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Plot1.png", width = 480, height = 480)
hist(powerdata1$Global_active_power, breaks=12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()






lines(powerdata1$datetime, powerdata1$Global_active_power)
