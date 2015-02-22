setwd("ExData_Plotting2")
unzip("exdata-data-NEI_data.zip")

# Check if both data exist. If not, load the data.

if (!"neiData" %in% ls()) {
  neiData <- readRDS("summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("Source_Classification_Code.rds")
}


head(sccData$Short.Name)



coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- neiData[neiData$SCC %in% coal$SCC, ]

coal <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")


plot(coal, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion Sources\n from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"),cex.main=0.85,lwd=2)



dev.copy(png,file="plot4.png", height=504, width=504)
dev.off()
