#download and read data into R
dataset.url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset.url, "project 1.zip")
unzip("project 1.zip", exdir = getwd())
file<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 stringsAsFactors=FALSE)
file$Date <- as.Date(file$Date,format='%d/%m/%Y')
dates=file$Date
data <- file[dates>=as.Date("2007-2-01") & dates<=as.Date("2007-2-02"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
#plot 1
plot1<-hist(data$Global_active_power, col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
