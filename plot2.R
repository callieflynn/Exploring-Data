##This file makes a graph to show if total emissions from PM2.5 decreased 
##in Baltimore City, Maryland (fips == "24510") from 1999 to 2008

NEI <- readRDS("summarySCC_PM25.rds") ##PM2.5 emissions data for 1999, 2002, 2005, and 2008

#Get Baltimore City data
BC <- subset(NEI, fips== "24510", select=c(year, Emissions))

##Construct the plot, save as png
png(filename="plot2.png", width=480, height=480)

EmissionsByYear <- aggregate(Emissions ~ year, BC, sum)

barplot(EmissionsByYear$Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
     names.arg=EmissionsByYear$year,
     main="Emissions in Baltimore City, MD 1999-2008", col="Green")

dev.off()
