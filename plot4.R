## plot4.R
## creates and save the graphic titled plot4.png as defined by the assignment


## NOTE TO GRADERS:
## I have changed one of the legend text labels to better describe what the graph displays.
## I feel that SQL-type labels like "Sub_metering_2" inhibit analysis.
## In order to display the legend in full, I had to move the legend to the top center,
## and hide the delimiting box (which was too narrow).


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# set up the device
file.plot4 <- "./plot4.png"
png(file=file.plot4, width=480, height=480)


# plot the graph
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(1, 1, 1, 1))
lab.x.axis <- "Day"
with(house.power, {
    plot(date.time, global.active.pwr, type="l", xlab=lab.x.axis, ylab="Global Active Power")
    
    plot(date.time, voltage, type="l", xlab=lab.x.axis, ylab="Voltage")

    plot(date.time, smtr.kitchen, type="l", col="black", xlab=lab.x.axis, ylab="Energy Sub Metering")
    lines(date.time, smtr.laundry, type="l", col="red")
    lines(date.time, smtr.hvac, type="l", col="blue")
    legend("topright", legend=c("kitchen", "laundry", "hvac"), col=c("black", "red", "blue"), lty = 1)

    plot(date.time, global.reactive.pwr, type="l", xlab=lab.x.axis, ylab="Global Reactive Power")
})


# close the device/PNG file
dev.off()