plot3 <- function()
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
      
      png(filename = "plot3.png", bg = "transparent")
      plot(hpc_subset$Time, hpc_subset$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
      points(hpc_subset$Time, hpc_subset$Sub_metering_1, type = "l")
      points(hpc_subset$Time, hpc_subset$Sub_metering_2, type = "l", col = "red")
      points(hpc_subset$Time, hpc_subset$Sub_metering_3, type = "l", col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(1, 2), col = c("black", "red", "blue"))
      dev.off()
}