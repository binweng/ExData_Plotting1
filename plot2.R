# get the data

setwd("/Users/bin/Google Drive/Coursera/Exploratory Data Analysis/")
f <- file.path(getwd(),"household_power_consumption.txt")
data <- read.table(f, header = T, sep = ";", stringsAsFactors = F, dec = '.')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

data_select = data[which(data$Date == "2007-02-01" 
                         | data$Date == "2007-02-02"),]

# make the plot

data_select$plot2.x <- paste(data_select$Date,data_select$Time)
data_select$plot2.x <- as.POSIXct(data_select$plot2.x)
data_select$Global_active_power <- as.numeric(data_select$Global_active_power)

plot(data_select$plot2.x,data_select$Global_active_power, type = "l"
     , ylab = "Global Active Power (kilowatts)", xlab ="")

# Save file

dev.copy(png,file = "plot2.png", height = 480, width = 480)
dev.off()
