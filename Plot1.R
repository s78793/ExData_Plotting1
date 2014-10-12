## Load the full power consumption file into R
full_file <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")

## Standardize date and time
full_file$Date <- as.Date(full_file$Date, "%d/%m/%Y")
full_file$Time <- paste(full_file$Date, full_file$Time, sep=" ")
full_file$Time <- strptime(full_file$Time, "%Y-%m-%d %H:%M:%S")


## Extract the data for 2/1/07 - 2/2/07

subset_file <- subset(full_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Plot 1

hist(subset_file$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()