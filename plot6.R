##This file makes a plot to answer the following question:
##Compare emissions from motor vehicle sources in Baltimore City (fips=="24510")
##with emissions from motor vehicle sources in Los Angeles County, California
##(fips == "06037"). Which city has seen greater changes over time
##in motor vehicle emissions?

require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") ##PM2.5 emissions data for 1999, 2002, 2005, and 2008
SCC <- readRDS("Source_Classification_Code.rds") ##provides a mapping from the SCC digit
BC <- subset(NEI, fips== "24510")
LA <- subset(NEI, fips=="06037")

##Get the SCC mapping and subset data for all vehicle emissions
cars <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCmapping <- SCC[cars,]$SCC

##Subset NEI data for matches
carsBC <- BC[BC$SCC %in% SCCmapping,]
carsLA <- LA[LA$SCC %in% SCCmapping,]

cities <- rbind(carsBC, carsLA)
cities$fips[which(cities$fips == "24510")] <- "Baltimore City"
cities$fips[which(cities$fips == "06037")] <- "Los Angeles County"

##Construct the plot, save it as PNG
png(filename="plot6.png", width=480, height=480)

g <- ggplot(cities, aes(factor(year), Emissions)) 
g + geom_bar(aes(fill=year), stat="identity") + facet_grid(.~fips) + 
  xlab("Year") + ylab("Total PM2.5 Emissions") + 
  ggtitle("Vehicle Emissions, 1999-2008") + guides(fill=FALSE)

dev.off()
