setwd("C:/Users/Aspen_2/Downloads/exdata_data_NEI_data")
pm25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classificat ion_Code.rds")

#Subsetting the pm25 dataset to include only values from Baltimore (fips = 24510)
balt <- subset(pm25, fips == 24510)

plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Project2Plot2.png", width = 480, height = 480)
plot(aggregate(balt$Emissions ~ balt$year, FUN = sum), type = "l", main = "Baltimore Emissions by Year", xlab = "Year", ylab = "Emissions")
dev.off()