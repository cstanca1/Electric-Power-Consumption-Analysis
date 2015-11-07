# The dataset has 2,075,259 rows and 9 columns, ~ 130 MB txt file. 
# Estimated memory requirements: 2M rows * 9 columns * 8 bytes/value ~ 144 MB. 

# Read data for the two dates of interest: 2007-02-01 and 2007-02-02. 
df <- "./data/household_power_consumption.txt"
data <- read.table(text = grep("^[1,2]/2/2007", readLines(df), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Perform conversions on date and time values
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# plot and save to plot3.png
png("plot3.png")
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()