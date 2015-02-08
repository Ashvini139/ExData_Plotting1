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

#subset the Data_feb for plot 2.
plot2_datetime <- strptime(paste(Data_feb$Date, Data_feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Data_feb$Global_active_power)

# create Plot or plot2.
plot(plot2_datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#saving plot2.
dev.copy(png, file="plot2.png", height=480, width=480)

#Close connection
dev.off()
