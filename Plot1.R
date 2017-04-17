#Read Data
powerCnFile<-"household_power_consumption.txt"

allData<-read.csv(powerCnFile,sep = ";",stringsAsFactors = FALSE, na.strings = "?")

#Convert Date Variable to Date format
allData$Date<-dmy(allData$Date)

#Keep only required Data
d1<-dmy("1/2/2007")
d2<-dmy("2/2/2007")

data<-allData[(allData$Date >=d1 & allData$Date<= d2),]
allData<-NULL

#Compute datetime column
data$DateTime<-as.POSIXct(paste(data$Date, data$Time))

# Open the png device and create histogram

png("Plot1.png",width=480,height=480,units = "px")

hist(as.numeric(data$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

#close the device
dev.off()
