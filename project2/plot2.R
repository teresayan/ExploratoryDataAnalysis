library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project2")

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")


png(file="plot2.png")
baltimore <- filter(NEI, fips == '24510')
baltimore_group <- group_by(baltimore, year)
baltimore_each_year <- summarize(baltimore_group, total=sum(Emissions))
with(baltimore_each_year, plot(year ,total, type="l", xlab ="year", ylab="PM 2.5 emitted (tons)"))
title(main="Total emissions in Baltimore City")
dev.off()


