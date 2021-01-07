NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
baltimore  <- NEI[NEI$fips=="24510", ]

data3 <- aggregate(Emissions ~ year + type, baltimore, sum)
png(filename="plot3.png", width = 640, height = 480)
g <- ggplot(data3, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Source of Baltimore Emissions ") 
print(g)
dev.off()