##This file makes a plot to answer the following question:
##Across the United States, how have emissions from 
##coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds") ##PM2.5 emissions data for 1999, 2002, 2005, and 2008
SCC <- readRDS("Source_Classification_Code.rds") ##provides a mapping from the SCC digit

##Get the SCC mapping and subset data for all coal AND combustion emissions
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalCombust <- coal & combustion
SCCmapping <- SCC[coalCombust,]$SCC

##Subset NEI data for matches
coalNEI <- NEI[NEI$SCC %in% SCCmapping,]

EmissionsByYear <- aggregate(Emissions ~ year, coalNEI, sum)

##Construct the plot, save it as PNG
png(filename="plot4.png", width=480, height=480)

barplot(EmissionsByYear$Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
             names.arg=EmissionsByYear$year,
             main="Emissions from Coal Combustion in the US, 1999-2008", 
             col="Green")
dev.off()

