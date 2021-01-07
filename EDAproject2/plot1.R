NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data1 <- aggregate(Emissions ~ year, NEI, FUN = sum)
png(filename="plot1.png", width = 640, height = 480)
with(data1, 
     barplot(height=Emissions/1e6, names.arg = year, ylim = c(0,8),
             xlab = "Year", ylab = expression('PM'[2.5]*' in Millions of Tons'),
             main = expression('Annual PM'[2.5]*' Emissions')))
dev.off()