setwd("C:/Users/Aspen_2/Downloads/exdata_data_NEI_data")
pm25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classificat ion_Code.rds")

#After investigating the scc data set, discovered values related to motor vehicles are all under the
#"ON-ROAD" type. Subsetting pm25 to include only values with type "ON-ROAD", and finding the sum
#of the values for each year. Also adding friendly names. 
pm25cars <- subset(pm25, type == "ON-ROAD" )
pm25baltcars <- subset(pm25cars, fips == "24510")
pm25baltsum <- aggregate(pm25baltcars$Emissions ~ pm25baltcars$year, FUN = sum)
names(pm25baltsum) <- c("Year", "Emissions")

plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Project2Plot5.png", width = 480, height = 480)
baltcarsplot <- qplot(data = pm25baltsum, x = Year, y = Emissions)
baltcarsplot <- baltcarsplot + stat_smooth(method="lm")
baltcarsplot
dev.off()
