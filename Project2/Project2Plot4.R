setwd("C:/Users/Aspen_2/Downloads/exdata_data_NEI_data")
pm25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classificat ion_Code.rds")

#Subsetting the scc data set to include only values related coal combustion
coalscc <- scc[grep("Coal", scc$Short.Name), ]
coalscc <- coalscc[grep("Comb", coalscc$Short.Name), SCC]

#Merging the coalscc dataset with the pm25 dataset, so that it only includes rows where
#the scc indicates that the values are related to coal combustion.
pm25coal <- merge(pm25, coalscc)
pm25plot <- aggregate(pm25coal$Emissions ~ pm25coal$year, FUN = sum)
names(pm25plot) <- c("Year", "Emissions")

library(ggplot2)

plot.new()
png("C:/Users/Aspen_2/Documents/R/ExploratoryData/Project2Plot4.png", width = 480, height = 480)
coalplot <- qplot(data = pm25plot, x =Year, y=Emissions)
coalplot <- coalplot + stat_smooth(method="lm")
coalplot
dev.off()