# plo2.R
# Reads data from household_power_consumption.txt and produces
# line plot as a function of time for global active power.
# NOTE: The IO for the txt file returns a dataframe with these
# column names: date, time, glbl.act.pwr, glbl.ract.pwr, voltage, 
# glbl.int, sub1, sub2, sub3.
# NOTE: glbl is short for global, act is short for active, pwr is 
# short for power and int is short for intensity. sub1, sub2 and
# sub3 are shortened submeterings.
# NOTE: date and time columns are just characters. They have been
# combined into a merged column date.time

# Read in data
source('data_IO.R')
data <- read_power_data()

# Select data around 2-days in February
fmt <- '%Y-%m-%d %H:%M:%S'
start_date <- as.POSIXct('2007-02-01 00:00:00', format = fmt)
end_date <- as.POSIXct('2007-02-02 23:59:59', format = fmt)
data <- subset(data, date.time >= start_date & date.time <= end_date)

# Setup plot device
png(filename = 'plot2.png', width = 480, height = 480)
plot(data$date.time, data$glbl.act.pwr, type='l', 
     ylab='Global Active Power (kW)', col='black', 
     main='Global Active Power', xlab='Time')
dev.off()