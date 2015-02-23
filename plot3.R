##This file makes a plot to answer the following question:
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
##variable, which of these four sources have seen decreases in emissions from 1999–2008 
##for Baltimore City? Which have seen increases in emissions from 1999–2008? 

require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") ##PM2.5 emissions data for 1999, 2002, 2005, and 2008

#Get Baltimore City data
BC <- subset(NEI, fips== "24510", select=c(year, Emissions, type), 
             function(dfsum(df$Emissions, na.rm=TRUE))
BC$type <- as.factor(BC$type)

##Construct the plot, save as png
png(filename="plot3.png", width=480, height=480)

##Set up the basic plot
g <- ggplot(BC, aes(factor(year), Emissions, fill=type))

##Add layers
g + geom_bar(stat="identity") + xlab("Year") + ylab("Total PM2.5 Emissions") +
  ggtitle("Total Annual Emissions by Type, Baltimore City") +
  facet_grid(.~type)

dev.off()
