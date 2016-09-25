# get the data

setwd("/Users/bin/Google Drive/Coursera/Exploratory Data Analysis/")
f <- file.path(getwd(),"household_power_consumption.txt")
data <- read.table(f, header = T, sep = ";", stringsAsFactors = F, dec = '.')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

data_select = data[which(data$Date == "2007-02-01" 
                         | data$Date == "2007-02-02"),]

# make the plot
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

data_select$plot4.x <- paste(data_select$Date,data_select$Time)
data_select$plot4.x <- as.POSIXct(data_select$plot4.x)
data_select$Global_active_power <- as.numeric(data_select$Global_active_power)
data_select$Sub_metering_1 <- as.numeric(data_select$Sub_metering_1)
data_select$Sub_metering_2 <- as.numeric(data_select$Sub_metering_2)
data_select$Sub_metering_3 <- as.numeric(data_select$Sub_metering_3)

plot(data_select$plot4.x,data_select$Global_active_power, type = "l"
     , ylab = "Global Active Power", xlab ="")

plot(data_select$plot4.x,data_select$Voltage, type = "l"
     , ylab = "Voltage", xlab ="datetime")

plot(data_select$plot4.x, data_select$Sub_metering_1, type = "l",
     ylab = "Energy Submetering", xlab = "")
lines(data_select$plot4.x, data_select$Sub_metering_2, col="red")
lines(data_select$plot4.x, data_select$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, lwd = 2, col = c("black","red","blue"),bty = "n")

plot(data_select$plot4.x,data_select$Global_reactive_power, type = "l"
     , ylab = "Global_reactive_power", xlab ="datetime")


dev.off()