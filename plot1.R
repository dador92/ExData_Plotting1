## plot1.R
## creates and save the graphic titled plot1.png as defined by the assignment


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# set up the device
file.plot1 <- "./plot1.png"
png(file=file.plot1, width=480, height=480)


# plot the graph
lab.x.axis <- "Global Active Power (kilowatts)"
hist(house.power$global.active.pwr, main="Global Active Power", xlab=lab.x.axis, col="red")


# close the device/PNG file
dev.off()