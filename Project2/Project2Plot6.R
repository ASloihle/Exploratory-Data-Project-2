setwd("C:/Users/Aspen_2/Downloads/exdata_data_NEI_data")
pm25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classificat ion_Code.rds")

#Subsetting pm25 dataset to values with type "ON-ROAD" (values related to motor vehicle emissions),
#and also subsetting to Baltimore and LA (fips 24510 and 06037). Also adding friendly names.
pm25cars <- subset(pm25, type == "ON-ROAD" )
pm25baltLAcars <- subset(pm25cars, fips == "24510" | fips == "06037")
baltLA <- aggregate(pm25baltLAcars$Emissions ~ pm25baltLAcars$year + pm25baltcars$fips, FUN = sum)
names(baltLA) <- c("Year", "City", "Emissions")

baltLA$City[baltLA$City == "24510"] <- "LA"
baltLA$City[baltLA$City == "06037"] <- "Baltimore"



plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Project2Plot6.png",  width = 480, height = 480)
LAbaltplot <- qplot(data = baltLA, x = Year, y = Emissions, color = City)
LAbaltplot <- LAbaltplot + geom_line(size = 2)
LAbaltplot <- LAbaltplot + geom_point(size = 5)
LAbaltplot
dev.off()
