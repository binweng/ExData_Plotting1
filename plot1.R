# get the data

setwd("/Users/bin/Google Drive/Coursera/Exploratory Data Analysis/")
f <- file.path(getwd(),"household_power_consumption.txt")
data <- read.table(f, header = T, sep = ";", stringsAsFactors = F, dec = '.')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

data_select = data[which(data$Date == "2007-02-01" 
                         | data$Date == "2007-02-02"),]

# make the plot

data_select$Global_active_power <- as.numeric(data_select$Global_active_power)

hist(data_select$Global_active_power, main= "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red")

# Save file

dev.copy(png,file = "plot1.png", height = 480, width = 480)
dev.off()
