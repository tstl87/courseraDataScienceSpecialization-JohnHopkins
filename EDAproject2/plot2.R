NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

neiBaltimore <- NEI[ NEI$fips=="24510", ]
data2 <- aggregate(Emissions ~ year, neiBaltimore, FUN = sum)
png(filename="plot2.png", width = 640, height = 480)
with(data2, 
     barplot(height=Emissions/1e3, names.arg = year, ylim = c(0,4),
             xlab = "Year", ylab = expression('PM'[2.5]*' in Thousands of Tons'),
             main = expression('Annual PM'[2.5]*' Emissions in Baltimore')))
dev.off()