## plot4.R
## creates and save the graphic titled plot4.png as defined by the assignment


# libraries
# nothing -- taken care in load_data.R


# load the data set
source("load_data.R")
load_data()


# reset the graphical parameters
dev.off()


# plot the graph
par(mfrow = c(2, 2), mar = c(4, 4, 2, 3), oma = c(2, 2, 2, 2))
with(house.power, {
    plot(date.time, active.power, type="l", xlab="", ylab="Global Active Power")
    
    plot(date.time, voltage, type="l", xlab="date, time", ylab="Voltage")

    plot(date.time, sub.meter.1, type="l", col="black", xlab="", ylab="Energy Sub Metering")
    lines(date.time, sub.meter.2, type="l", col="red")
    lines(date.time, sub.meter.3, type="l", col="blue")
    legend("top", legend=c("kitchen", "laundry", "HVAC"), col=c("black", "red", "blue"), lty = 1, box.col="white")
    box(which="plot", lty="solid")
    
    plot(date.time, reactive.power, type="l", xlab="", ylab="Global Reactive Power")
})


# copy the graph to a PNG file
file.plot4 = "./plot4.png"
if (file.exists(file.plot4)) file.remove(file.plot4)
dev.copy(png, file.plot4)  # file gets copied in 480x480 size, so no adjustment needed
dev.off()