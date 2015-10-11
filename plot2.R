plot2 <- function()
{
      # It is assumed that file household_power_consumption.txt is located at
      # the current working directory.
      hpc = read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
      hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")
      
      # Next we subset those rows pertinent to specified days.
      hpc_subset = hpc[(hpc$Date == as.Date("2007/02/01") | hpc$Date == as.Date("2007/02/02")),]
      
      # The time variable is initially read as Factor, so we have to fix this up.
      hpc_subset$Time = paste(hpc_subset$Date, hpc_subset$Time)
      hpc_subset$Time = strptime(hpc_subset$Time, format = "%Y-%m-%d %H:%M:%S")
      
      png(filename = "plot2.png", bg = "transparent")
      plot(hpc_subset$Time, hpc_subset$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
      dev.off()
}