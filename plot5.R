##This file makes a plot to answer the following question:
##How have emissions from motor vehicle sources changed 
##from 1999–2008 in Baltimore City (fips 24510)?

NEI <- readRDS("summarySCC_PM25.rds") ##PM2.5 emissions data for 1999, 2002, 2005, and 2008
SCC <- readRDS("Source_Classification_Code.rds") ##provides a mapping from the SCC digit
BC <- subset(NEI, fips== "24510")

##Get the SCC mapping and subset data for all vehicle emissions
cars <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCmapping <- SCC[cars,]$SCC

##Subset NEI data for matches
carsNEI <- BC[BC$SCC %in% SCCmapping,]

EmissionsByYear <- aggregate(Emissions ~ year, carsNEI, sum)

##Construct the plot, save it as PNG
png(filename="plot5.png", width=480, height=480)

barplot(EmissionsByYear$Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
        names.arg=EmissionsByYear$year,
        main="Baltimore City Vehicle Emissions, 1999-2008", 
        col="Green")
dev.off()

