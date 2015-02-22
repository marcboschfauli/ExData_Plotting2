setwd("ExData_Plotting2")
unzip("exdata-data-NEI_data.zip")
# Check if both data exist. If not, load the data.

if (!"neiData" %in% ls()) {
  neiData <- readRDS("summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("Source_Classification_Code.rds")
}
head(neiData)
dim(neiData)
head(sccData)
dim(sccData) 


totalEmissions <- 
  aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")

# Plot of the total emmissions in the USA

plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"),cex.main=0.85,lwd=2)
# Save to PNG File 
dev.copy(png,file="plot1.png", height=504, width=504)
dev.off()
