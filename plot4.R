#plot 4
#Read data file under folder 'data'
#download and read data into R
dataset.url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset.url, "project 1.zip")
unzip("project 1.zip", exdir = getwd())
file<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 stringsAsFactors=FALSE)
#transform to data
file$Date <- as.Date(file$Date,format='%d/%m/%Y')
dates=file$Date
# select data in 2007-02-01 and 2007-02-02
data <- file[dates>=as.Date("2007-2-01") & dates<=as.Date("2007-2-02"),]
#transform factor type to time
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time,format = "%Y-%m-%d %H:%M:%S")
#transform factor type to double
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#plot graphic to png file
png(filename = "plot4.png")
par(mfrow = c(2, 2))

x <- data$Time
active <- data$Global_active_power
reactive <- as.numeric(as.character(data$Global_reactive_power))
voltage <- as.numeric(as.character(data$Voltage))

#plot1
plot(x, active , type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot2
plot(x, voltage , type="l", xlab="datetime", ylab="Voltage")

#plot3
s1 <- as.numeric(as.character(data$Sub_metering_1))
s2 <- as.numeric(as.character(data$Sub_metering_2))
s3 <- data$Sub_metering_3
plot(x,s1,type = "n", xlab = "", ylab = "Energy Sub Metering")
lines(x, s1, col = "black")
lines(x, s2, col = "red")
lines(x, s3, col ="blue")
legend("topright",lwd=2,lty=1,col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#plot4
plot(x, reactive , type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
