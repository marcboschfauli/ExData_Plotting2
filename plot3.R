setwd("ExData_Plotting2")
unzip("exdata-data-NEI_data.zip")
# Check if both data exist. If not, load the data.

if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}


if (!"neiData_bc" %in% ls()) {
  neiData_bc <- neiData[neiData$fips == "24510", ] 
}

library(ggplot2)



# Plot of the total emmissions in Baltimore City classified by type

g <- ggplot(neiData_bc, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")


dev.copy(png,file="plot3.png", height=504, width=504)
dev.off()
