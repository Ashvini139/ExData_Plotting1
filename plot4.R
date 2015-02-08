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

#subset the Data_feb for plot 4.
Plot4_datetime <- strptime(paste(Data_feb$Date, Data_feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(Data_feb $Sub_metering_1)
subMetering2 <- as.numeric(Data_feb $Sub_metering_2)
subMetering3 <- as.numeric(Data_feb $Sub_metering_3)
GAP_plot4 <- as.numeric(Data_feb$Global_active_power)
GRP_plot4 <- as.numeric(Data_feb $Global_reactive_power)
Volt_plot4 <- as.numeric(Data_feb $Voltage)

#Creating plot 4
par(mfrow = c(2, 2)) 
plot(Plot4_datetime, GAP_plot4, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Plot4_datetime, Volt_plot4, type="l", xlab="datetime", ylab="Voltage")
plot(Plot4_datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(Plot4_datetime, subMetering2, type="l", col="red")
lines(Plot4_datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,  cex=0.64, col=c("black", "red", "blue"))
plot(Plot4_datetime, GRP_plot4, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
#Close connection
dev.off()
#Close connection
dev.off()
