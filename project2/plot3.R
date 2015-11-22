library(ggplot2)
library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project2")

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")




png(file="plot3.png")
type_group <- group_by(NEI,type,year)
type_each_year <- summarize(type_group, total=sum(Emissions))
g <- ggplot(type_each_year, aes(year,total))
g <- g + geom_line(aes(color=type))
g <- g + ggtitle("Emissions in Baltimore City") + xlab("year") + ylab("emissions (tons)")
print(g)
# All four types have seen decreases from 1999-2008, NON-POINT and ON-ROAD has been continuously decreasing
# but POINT and NON-ROAD has first increase and then decrease again
#       type  year     total
#         (chr) (int)     (dbl)
#         1  NON-ROAD  1999  307126.5
#         2  NON-ROAD  2002  344087.5
#         3  NON-ROAD  2005  313628.1
#         4  NON-ROAD  2008  183666.2
#         5  NONPOINT  1999 5518185.3
#         6  NONPOINT  2002 4254247.0
#         7  NONPOINT  2005 4043390.2
#         8  NONPOINT  2008 2438866.9
#         9  ON-ROAD  1999  183895.1
#        10  ON-ROAD  2002  154222.2
#        11  ON-ROAD  2005  134291.8
#        12  ON-ROAD  2008  107384.1
#        13    POINT  1999 1323759.8
#        14    POINT  2002  883223.8
#        15    POINT  2005  963392.9
#        16    POINT  2008  734288.6
dev.off()

