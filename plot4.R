# plot4.R
#   create for plots and store in a single png file
#   input:  household_power_consumption file
#   filtered: Feb 1, 2007 and Feb 2, 2007
#   output:  four plots stored in plot4.png file

#  Read in the entire input file - separated by ";", convert ? to NA
hpc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                na.strings="?")

# pull out only rows that occurred on February 1st & 2nd, 2007
hpc_sub <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

# creat a timestamp by combining date and time
hpc_sub$TimeStamp <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %T")

png(filename="plot4.png", width=480, height=480)

# set plot parameters for 2x2 plot area, adjust labels
par(mfcol=c(2,2))
par(cex.lab=.8)
par(cex.axis=.8)

# plot 1 - Global Active Power over time
plot(hpc_sub$TimeStamp, hpc_sub$Global_active_power, 
     type="n",
     ylab="Global Active Power",
     xlab="")

lines(hpc_sub$TimeStamp, hpc_sub$Global_active_power)

# plot 2 - Sub meetering over time
plot(hpc_sub$TimeStamp, hpc_sub$Sub_metering_1, type="n",
     ylab="Energy sub metering",
     xlab="")

with(hpc_sub, {
  lines(hpc_sub$TimeStamp, hpc_sub$Sub_metering_1, col="black")
  lines(hpc_sub$TimeStamp, hpc_sub$Sub_metering_2, col="red")
  lines(hpc_sub$TimeStamp, hpc_sub$Sub_metering_3, col="blue")
})

legend("topright", lty=c(1,1,1), col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pt.cex=1, cex=.75, bty="n")

# plot 3 - Voltage over time
plot(hpc_sub$TimeStamp, hpc_sub$Voltage, 
     type="n",
     ylab="Voltage",
     xlab="datetime")

lines(hpc_sub$TimeStamp, hpc_sub$Voltage)

# plot 4 - Global reactive power over time
plot(hpc_sub$TimeStamp, hpc_sub$Global_reactive_power, 
     type="n",
     ylab="Global_reactive_power",
     xlab="datetime")

lines(hpc_sub$TimeStamp, hpc_sub$Global_reactive_power)

dev.off()