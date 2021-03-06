# The dataset has 2,075,259 rows and 9 columns, ~ 130 MB txt file. 
# Estimated memory requirements: 2M rows * 9 columns * 8 bytes/value ~ 144 MB. 

# Read data for the two dates of interest: 2007-02-01 and 2007-02-02. 
df <- "./data/household_power_consumption.txt"
data <- read.table(text = grep("^[1,2]/2/2007", readLines(df), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Perform conversions on date and time values
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# plot and save to plot1.png
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
+     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
+         1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()