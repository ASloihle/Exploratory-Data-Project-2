setwd("C:/Users/Aspen_2/Downloads/exdata_data_NEI_data")
pm25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classificat ion_Code.rds")


plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Project2Plot1.png", width = 480, height = 480)
plot(aggregate(pm25$Emissions ~ pm25$year, FUN = sum), type = "l", xlab = "Year", ylab = "Emissions", main = "Total pm2.5 Emissions by Year")
dev.off()
