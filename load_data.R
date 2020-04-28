## load_data.R
## Loads and cleans the data from the Household Power Consumption 
## data set. Since all four drawing scripts need this functionality,
## it made sense to drop this functionality into a separate script 
## for reuse.


library(curl)
library(readr)
library(data.table)
library(dplyr)
library(lubridate)


## load_data() loads the data set into a global variable called house.power
## startClean marks whether the data should be freshly downloaded and read in
load_data <- function(startClean=FALSE) {
    
    # definitions
    zipfile <- "exdata_data_household_power_consumption.zip"
    datafile <- "household_power_consumption.txt"
    
    
    # 0. clean up the environment
    if (startClean) {
        if (file.exists(zipfile)) file.remove(zipfile)
        if (file.exists(datafile)) file.remove(datafile)
        if (exists("house.power", envir = .GlobalEnv)) rm("house.power", envir = .GlobalEnv)
    }
    
    
    # 1. download the zip file if necessary
    if (! file.exists(zipfile)) {
        sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        curl_download(url=sourceUrl, destfile=zipfile, quiet=FALSE) 
    }
    
    
    # 2. unzip the data file if necessary
    if (! file.exists(datafile)) {
        unzip(zipfile, exdir="./")
    }
    
    
    # 3. read in and clean up the data set
    if (exists("house.power", envir = .GlobalEnv)) {
        print("data set already loaded")
    } else {
        print("loading data set from file")
        
        # define readable column names
        colnames = c(
            "date.time",      # date & time columns will get collpased
            "time",
            "active.power",
            "reactive.power",
            "voltage",
            "intensity",
            "sub.meter.1",
            "sub.meter.2",
            "sub.meter.3"
        )
        
        # speed up fread by defining initial column classes
        colclasses = c(
            "character",   # date
            "character",   # time
            "double",      # active.power
            "double",      # reactive.power
            "double",      # voltage
            "double",      # intensity
            "numeric",     # sub.meter.1
            "numeric",     # sub.meter.2
            "numeric"      # sub.meter.3
        )
        
        # read in the file and clean it up
        house.power <<- 
            # a. read in the file
            fread(
                datafile, 
                sep=";", 
                col.names=colnames, 
                colClasses=colclasses, 
                skip=66637,        # skipping up until 2007-02-01
                nrows=2880,        # only reading thru 2007-02-02
                na.strings=c("NA", "?")) %>% 
            
            # b. convert the sub-meters to integers
            mutate_at(c("sub.meter.1", "sub.meter.2", "sub.meter.3"), as.integer) %>%
            
            # c. convert the strings for date & time into a usable POSIXct variable
            mutate(date.time = parse_date_time(paste(date.time, time), "%d/%m/%Y %T", exact=TRUE)) %>%
            
            # d. drop the time variable -- it's now in date.time
            select(-time)
        
        # review the structure
        str(house.power)
    }
    
    return(TRUE)
}