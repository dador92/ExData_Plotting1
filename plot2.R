## plot2.R
## creates and save the graphic titled plot2.png as defined by the assignment


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# reset the graphical parameters
dev.off()


# plot the graph
lab.y.axis = "Global Active Power (kilowatts)"
with(house.power, plot(date.time, active.power, type="l", xlab="", ylab=lab.y.axis))


# copy the graph to a PNG file
file.plot2 = "./plot2.png"
if (file.exists(file.plot2)) file.remove(file.plot2)
dev.copy(png, file.plot2)  # file gets copied in 480x480 size, so no adjustment needed
dev.off()