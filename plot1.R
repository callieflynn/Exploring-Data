##This file makes a graph to show if total emissions from PM2.5 decreased 
##in the United States from 1999 to 2008
##Using the base plotting system, it makes a plot showing the total PM2.5 
##emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds") ##PM2.5 emissions data for 1999, 2002, 2005, and 2008

EmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

##Construct the plot, save it as PNG
png(filename="plot1.png", width=480, height=480)

barplot(EmissionsByYear$Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
        names.arg=EmissionsByYear$year,
        main="Emissions in the US, 1999-2008", col="Green")

dev.off()
