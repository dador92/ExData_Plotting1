## plot1.R
## creates and save the graphic titled plot1.png as defined by the assignment


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# reset the graphical parameters
dev.off()


# plot the graph
lab.x.axis = "Global Active Power (kilowatts)"
hist(house.power$active.power, main = "Global Active Power", xlab=lab.x.axis, col="red")


# copy the graph to a PNG file
file.plot1 = "./plot1.png"
if (file.exists(file.plot1)) file.remove(file.plot1)
dev.copy(png, file.plot1)  # file gets copied in 480x480 size, so no adjustment needed
dev.off()
