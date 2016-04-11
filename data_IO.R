read_power_data <- function() {
  ## Function reads data an returns a dataframe with the data.
  file <- 'household_power_consumption.txt'
  col_names <- c('date', 'time', 'glbl.act.pwr',
                 'glbl.ract.pwr','voltage','glbl.int',
                 'sub1', 'sub2', 'sub3')
  col_classes <- c('character','character','numeric','numeric',
                   'numeric','numeric','numeric',
                   'numeric','numeric')
  data <- read.delim(file, header = TRUE, sep = ';',
                     col.names = col_names, 
                     colClasses = col_classes, 
                     skip = 1, na.strings = '?')
  temp <- paste(data$date, data$time, sep = ' ')
  data$date.time <- as.POSIXct(temp, format='%d/%m/%Y %H:%M:%S')
  return(data)
}