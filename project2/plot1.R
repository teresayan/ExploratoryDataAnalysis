library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


png(file="plot1.png")

par(mfrow=c(1,1))

emissions <- group_by(NEI, year)
emission_each_year <- summarize(emissions, total=sum(Emissions))

emissionyear <- as.numeric(as.character(emission_each_year$total))
with(emission_each_year, plot(year, total, type="l", xlab = "year", ylab="PM2.5 emitted (tons)"))
title(main="Total PM2.5 emission in United States")
dev.off()

# The total emissions PM2.5 has decreased from 1999 to 2008
