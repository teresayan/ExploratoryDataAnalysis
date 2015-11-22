library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project2")

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")


png(file="plot5.png")
baltimore <- filter(NEI, fips == '24510')
baltimore_motorvehicle <- filter(baltimore, type == 'ON-ROAD')
baltimore_motorvehicle_group <- group_by(baltimore_motorvehicle, year)
baltimore_motorvehicle_each_year <- summarize(baltimore_motorvehicle_group, total=sum(Emissions))
with(baltimore_motorvehicle_each_year, plot(year ,total, type="l", xlab ="year", ylab="PM 2.5 emitted (tons)"))
#
#   year     total
#     (int)     (dbl)
#     1  1999 346.82000
#     2  2002 134.30882
#     3  2005 130.43038
#     4  2008  88.27546
# Emissions from motor vehicle sources in Baltimore City decreases from 1999 to 2008
title("Motor vehicle emissions in Baltimore City")
dev.off()

