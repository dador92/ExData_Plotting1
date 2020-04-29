## plot2.R
## creates and save the graphic titled plot2.png as defined by the assignment


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# set up the graphical parameters
dev.off()
file.plot2 = "./plot2.png"
png(file=file.plot2, width=480, height=480)


# plot the graph
lab.y.axis = "Global Active Power (kilowatts)"
with(house.power, plot(date.time, global.active.pwr, type="l", xlab="Day", ylab=lab.y.axis))


# close the device/PNG file
dev.off()