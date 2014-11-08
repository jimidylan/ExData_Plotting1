#download and read data into R
dataset.url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset.url, "project 1.zip")
unzip("project 1.zip", exdir = getwd())
file<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 stringsAsFactors=FALSE)
file$Date <- as.Date(file$Date,format='%d/%m/%Y')
dates=file$Date
data <- file[dates>=as.Date("2007-2-01") & dates<=as.Date("2007-2-02"),]
#Convert 3 sub meter variables to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
#create date/time vector
v1<-strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
#Plot 3
plot3<-plot(v1, data$Sub_metering_1 , type="l", xlab="",col="black",
            ylab="Energy sub metering")
lines(v1, data$Sub_metering_2, col = "red")
lines(v1, data$Sub_metering_3, col ="blue")
legend("topright",lwd=2,lty=1,col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
