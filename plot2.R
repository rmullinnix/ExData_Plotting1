# plot2.R
#   create a line graph for Global Active Power over time
#   input:  household_power_consumption file
#   filtered: Feb 1, 2007 and Feb 2, 2007
#   output:  line graph stored in plot2.png file

#  Read in the entire input file - separated by ";", convert ? to NA
hpc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                na.strings="?")

# pull out only rows that occurred on February 1st & 2nd, 2007
hpc_sub <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

# create the timestamp by combining the date and time fields
hpc_sub$TimeStamp <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %T")

png(filename="plot2.png")

# create the plot area, but do not add anything
plot(hpc_sub$TimeStamp, hpc_sub$Global_active_power, 
     type="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#plot the lines
lines(hpc_sub$TimeStamp, hpc_sub$Global_active_power)

dev.off()