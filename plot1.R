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
###  Saving plot to PNG image plot1.png
###################################################################

png(file="plot1.png",
    width=480, height=480)
hist(chart_data$Global_active_power, main = "Global active power", xlab = "Global active power (kilowats)", c = "red")
dev.off()