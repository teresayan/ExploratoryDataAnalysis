library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project2")

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")


png(file="plot4.png")
coal_combustion <- filter(SCC, grepl('Comb',EI.Sector), grepl('Coal',EI.Sector))
coal_combustion_data <- merge(NEI,coal_combustion)
coal_combustion_group <- group_by(coal_combustion_data, year)
coal_combustion_each_year <- summarize(coal_combustion_group, total=sum(Emissions))
#  coal_combustion related
#   year    total
#     (int)    (dbl)
#     1  1999 572126.5
#     2  2002 546789.2
#     3  2005 552881.5
#     4  2008 343432.2
# Emissions from coal-related combustion sources decrease in 2002 and then increase back in 2005 and then decrease again in 2008
with(coal_combustion_each_year, plot(year,total,type="l",xlab="year",ylab="PM2.5 emitted (tons)"))
title("Coal combustion-related emissions in United States")
dev.off()

