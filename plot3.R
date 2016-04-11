# plot3.R
# Reads data from household_power_consumption.txt and produces
# line plot as a function of time for sub1, sub2 and sub3.
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
png(filename = 'plot3.png', width = 480, height = 480)
plot(data$date.time, data$sub1, type='n', 
     ylab='Energy Sub-metering (W-hr)', col='black', 
     main='Sub-metering', xlab='Time')

# Plots
lines(data$date.time, data$sub1, type = 'l', col='black')
lines(data$date.time, data$sub2, type = 'l', col='red')
lines(data$date.time, data$sub3, type = 'l', col='blue')
legend('topright', col=c('black','red','blue'),
       legend=c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'),
       lty=c(1,1,1))

dev.off()