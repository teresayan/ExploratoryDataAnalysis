library(datasets)
library(dplyr)
setwd("/Users/teresayan/rprogram/course4/project2")

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")


png(file="plot6.png")
losangeles <- filter(NEI, fips == '06037')
losangeles_motorvehicle <- filter(losangeles, type == 'ON-ROAD')
losangeles_motorvehicle_group <- group_by(losangeles_motorvehicle, year)
losangeles_motorvehicle_each_year <- summarize(losangeles_motorvehicle_group, total=sum(Emissions))
colnames(losangeles_motorvehicle_each_year) <- c('year','total')
colnames(baltimore_motorvehicle_each_year) <- c('year', 'total')
losangeles_motorvehicle_data <- cbind(location="Los Angeles County", losangeles_motorvehicle_each_year)
baltimore_motorvehicle_data <- cbind(location="Baltimore City", baltimore_motorvehicle_each_year)

merge_data <- rbind(baltimore_motorvehicle_data, losangeles_motorvehicle_data)
g <- ggplot(merge_data, aes(year,total))
g <- g + geom_line(aes(color=location)) + ggtitle("Motor vehicle emissions") + xlab("year") + ylab("PM2.5 emitted (tons)")
print(g)
# Motor Vehicle in Los Angeles County has more emissions compared than vehicles in Baltimore City
# At the same time, Los Angeles has shown greater changes over time in motor vehicle emissions,
# it increases and then decreases

dev.off()
