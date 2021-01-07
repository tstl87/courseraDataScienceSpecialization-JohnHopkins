NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- SCC[grep("Vehicle", SCC$EI.Sector), "SCC"]
data5 <- NEI %>% 
  filter(SCC %in% vehicles & fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

png("plot5.png", width = 640, height = 480)
g <- ggplot(data5, aes(x=as.factor(year), y=Emissions, label=Emissions)) +
  geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Tons')) + xlab("Year") +
  ggtitle("Baltimore Vehicle Emissions")
print(g)
dev.off()