#download and inport the data
dataset.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset.url, "project 1.zip")
unzip("project 1.zip", exdir = getwd())
file<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 stringsAsFactors=FALSE)
file$Date <- as.Date(file$Date,format='%d/%m/%Y')
data$Time <- strptime(data$Time, format="%H:%M:%S")
dates=file$Date
data <- file[dates>=as.Date("2007-2-01") & dates<=as.Date("2007-2-02"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
#plot 2
v1<-as.vector(strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S"))
plot(v1, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
