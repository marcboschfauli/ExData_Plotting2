setwd("ExData_Plotting2")
unzip("exdata-data-NEI_data.zip")

# Check if both data exist. If not, load the data.

if (!"neiData" %in% ls()) {
  neiData <- readRDS("summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("Source_Classification_Code.rds")
}


neiData_bc <- subset(neiData,fips=="24510")


# Retrieve motor related information
motor <- grep("motor", sccData$Short.Name, ignore.case = TRUE)
motor <- sccData[motor, ]
motor <- neiData_bc[neiData_bc$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"),cex.main=0.85,lwd=2)



dev.copy(png,file="plot5.png", height=504, width=504)
dev.off()
