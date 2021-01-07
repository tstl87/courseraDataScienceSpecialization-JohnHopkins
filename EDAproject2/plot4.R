NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)
library(dplyr)

coal <- SCC[grep("Coal", SCC$EI.Sector), "SCC"]
data4 <- NEI %>% 
  filter(SCC %in% coal) %>% 
  group_by(year) %>% 
  summarise(Emissions = sum(Emissions))

png(filename="plot4.png", width = 640, height = 480)
g <- ggplot(data4, aes(x=as.factor(year), y=Emissions/1e3, label=Emissions/1e3)) +
  geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Thousands of Tons')) + xlab("Year") +
  ggtitle("Coal Emissions")
print(g)
dev.off()