# plot3.R
#   create a line graph for the three sub metering observations over time
#     add a legend to show the three distinct lines
#   input:  household_power_consumption file
#   filtered: Feb 1, 2007 and Feb 2, 2007
#   output:  multi line graph stored in plot3.png file

#  Read in the entire input file - separated by ";", convert ? to NA
hpc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                na.strings="?")

# pull out only rows that occurred on February 1st & 2nd, 2007
hpc_sub <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

# create a timestamp by combining the date and the time
hpc_sub$TimeStamp <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %T")

png(filename="plot3.png")

# create the plat area
plot(hpc_sub$TimeStamp, hpc_sub$Sub_metering_1, type="n",
    ylab="Energy sub metering",
    xlab="")

# add a line for each sub metering observation
with(hpc_sub, {
        lines(hpc_sub$TimeStamp, hpc_sub$Sub_metering_1, col="black")
        lines(hpc_sub$TimeStamp, hpc_sub$Sub_metering_2, col="red")
        lines(hpc_sub$TimeStamp, hpc_sub$Sub_metering_3, col="blue")
})

# create a legend for the three lines
legend("topright", lty=c(1,1,1), col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()