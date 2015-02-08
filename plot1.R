# Read the data.
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#create subset of data from the dates 2007-02-01 and 2007-02-02. 
Data_feb <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subset the Data_feb for plot 1.
Data_plot1 <- as.numeric(Data_feb$Global_active_power)

# create histogram or plot1.
hist(Data_plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#saving plot1.
dev.copy(png, file="plot1.png", height=480, width=480)

#Close connection
dev.off()
