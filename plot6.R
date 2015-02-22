setwd("ExData_Plotting2")
unzip("exdata-data-NEI_data.zip")

# Check if both data exist. If not, load the data.

if (!"neiData" %in% ls()) {
  neiData <- readRDS("summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("Source_Classification_Code.rds")
}


neiData_bc_la <- subset(neiData,fips=="24510"|fips=="06037")

motor <- grep("motor", sccData$Short.Name, ignore.case = TRUE)
motor <- sccData[motor, ]
motor <- neiData_bc_la[neiData_bc_la$SCC %in% motor$SCC, ]

library(ggplot2)

g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

dev.copy(png,file="plot6.png", height=504, width=504)
dev.off()
