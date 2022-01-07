###################################################################
###  Loading necessary libraries
###################################################################

library(readr)
library(dplyr)


###################################################################
###  Setting working directory change ~ for your path
###  Loading base data
###  Filtering data for 2007-02-01 and 2007-02-02
###  Removing base data from memory
###################################################################

setwd("~")

base_data <- read_delim("household_power_consumption.txt",delim = ";" , na = "?", col_types = list(
  Date = col_date(format = "%d/%m/%Y"),
  Time = col_time(),
  Global_active_power = col_number(),
  Global_reactive_power = col_number(),
  Voltage = col_number(),
  Global_intensity = col_number(),
  Sub_metering_1 = col_number(),
  Sub_metering_2 = col_number(),
  Sub_metering_3 = col_number()
))

chart_data <- base_data %>%
  filter(between(Date, as.Date('2007-02-01'), as.Date('2007-02-02')))

rm(base_data)

###################################################################
###  Saving plot to PNG image plot3.png
###################################################################

png(file="plot3.png",
    width=480, height=480)
plot(chart_data$Sub_metering_1, type = "l", xaxt="none", xlab = "", ylab = "Energy sub metering", col = "black")
lines(chart_data$Sub_metering_2, col = "red")
lines(chart_data$Sub_metering_3, col = "blue")
axis(side =1, at= c(1, nrow(chart_data)/2, nrow(chart_data)), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lty = 1)
dev.off()