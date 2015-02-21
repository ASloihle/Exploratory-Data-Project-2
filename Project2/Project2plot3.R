setwd("C:/Users/Aspen_2/Downloads/exdata_data_NEI_data")
pm25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classificat ion_Code.rds")

#Subsetting pm25 dataset to include only values from Baltimore (fips = 24510), and
#adding the values together for each year to get a total. Also adding friendly names.
balt <- subset(pm25, fips == 24510)
balttypessum <- aggregate(balt$Emissions ~ balt$year + balt$type, FUN = sum)
names(balttypessum) <- c("Year", "Type", "Emissions")

library(ggplot2)

plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Project2Plot3.png", width = 480, height = 480)
balttypesplot <- qplot(data = balttypessum, x = Year, y = Emissions, facets = .~Type)
balttypesplot <- balttypesplot + stat_smooth(method="lm")
balttypesplot
dev.off()
