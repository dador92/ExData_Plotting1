## plot2.R
## creates and save the graphic titled plot2.png as defined by the assignment


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# set up the device
file.plot2 <- "./plot2.png"
png(file=file.plot2, width=480, height=480)


# plot the graph
lab.x.axis <- "Day"
lab.y.axis <- "Global Active Power (kilowatts)"
with(house.power, plot(date.time, global.active.pwr, type="l", xlab=lab.x.axis, ylab=lab.y.axis))


# close the device/PNG file
dev.off()