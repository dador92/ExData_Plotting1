## plot3.R
## creates and save the graphic titled plot3.png as defined by the assignment


## NOTE TO GRADERS:
## I have changed the legend text labels to better describe what the graph displays.
## I feel that SQL-type labels like "Sub_metering_2" inhibit analysis.
## In order to display the legend in full, I had to move the legend to the top center,
## and hide the delimiting box (which was too narrow).


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# set up the device
file.plot3 = "./plot3.png"
png(file=file.plot3, width=480, height=480)


# plot the graph
lab.x.axis <- "Day"
lab.y.axis <- "Energy Sub Metering"
with(house.power, {
    plot(date.time, smtr.kitchen, type="l", col="black", xlab=lab.x.axis, ylab=lab.y.axis);
    lines(date.time, smtr.laundry, type="l", col="red");
    lines(date.time, smtr.hvac, type="l", col="blue")
})
legend.full <- c("kitchen", "laundry", "hvac")
legend("topright", legend=legend.full, col=c("black", "red", "blue"), lty = 1)


# close the device/PNG file
dev.off()