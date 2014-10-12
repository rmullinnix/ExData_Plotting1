# plot1.R
#   create a histogram graph for Global Active Power
#   input:  household_power_consumption file
#   filtered: Feb 1, 2007 and Feb 2, 2007
#   output:  histogram stored in plot1.png file

#  Read in the entire input file - separated by ";", convert ? to NA
hpc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                na.strings="?")

# pull out only rows that occurred on February 1st & 2nd, 2007
# date is file is formatted as day/month/Year 
hpc_sub <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

# open the png file
png(filename="plot1.png")

# create the histogram - set axis and main labels
hist(hpc_sub$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

# close the png file
dev.off()