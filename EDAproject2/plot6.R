NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data6a <- data.frame(fips = c("06037", "24510"), county = c("Los Angeles", "Baltimore"))

vehicles <- SCC[grep("Vehicle", SCC$EI.Sector), "SCC"]
data6b <- NEI %>%
  filter(SCC %in% vehicles & fips %in% data6a$fips) %>%
  group_by(fips, year) %>%
  summarize(Emissions = sum(Emissions))

data6 <- merge(data6a, data6b)

png("plot6.png", width = 640, height = 480)
g <- ggplot(data6, aes(x = factor(year), y = Emissions, 
                                          label=Emissions)) +
  geom_bar(stat = "identity") + facet_grid(. ~ county) +
  ylab(expression('PM'[2.5]*' Emissions in Tons')) + xlab("Year") +
  ggtitle("Los Angeles vs Baltimore Vehicle Emissions.")
print(g)
dev.off()