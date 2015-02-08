#Download the data from Website.
if (!file.exists("./data")){dir.create("./data")}
fileUrl = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/datasetzip.zip")
#Zipped data need to unzipped.
unzip(zipfile="./data/datasetzip.zip", exdir="./data")
# Read the data.
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#create subset of data from the dates 2007-02-01 and 2007-02-02. 
Data_feb <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subset the Data_feb for plot 3.
plot3_datetime <- strptime(paste(Data_feb$Date, Data_feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(Data_feb $Sub_metering_1)
subMetering1 <- as.numeric(Data_feb $Sub_metering_1)
subMetering2 <- as.numeric(Data_feb $Sub_metering_2)
subMetering3 <- as.numeric(Data_feb $Sub_metering_3)
# create Plot or plot3.
plot(plot3_datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(plot3_datetime, subMetering2, type="l", col="red")
lines(plot3_datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#saving plot3.
dev.copy(png, file="plot3.png", height=480, width=480)
#Close connection
dev.off()

