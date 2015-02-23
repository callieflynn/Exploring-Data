# Exploring-Data
Using Graphs to Explore Emissions Data

## Introduction
[From Roger D. Peng, PhD, on Coursera] Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). More information about the NEI is available at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data for this project are for 1999, 2002, 2005, and 2008.

## Data Overview
Data for this project is available online a single zip file from Data for Peer Assessment [29Mb]
The zip file contains two files:
PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year
Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

## Exploratory Questions
The overall goal is to explore the National Emissions Inventory database and see what it says about fine particulate matter pollution in the United states over the 10-year period 1999–2008. To explore the data, I create six graphs to answer the following questions. Each plot and code to reproduce the plot are encapsulated in their own files (plot1.R, plot1.png, etc.)

1.	Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? As shown in the bar chart, total emissions have decreased since 1999.

2.	Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? As illustrated by the bar chart, emissions in Baltimore City have bounced around a bit in the last 10 years. 2008 did see the lowest levels of emissions, though.

3.	Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Three variables have decreased each year since 1999: non-road, nonpoint, and on-road. Point emissions went up each year except 2008, which showed a large decrease in emissions.

4.	Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? Yes, emissions from coal combustion have decreased.

5.	Have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? Yes, emissions have decreased.

6.	Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions? Los Angeles County has seen greater changes, although Baltimore City has decreased emissions each year.
