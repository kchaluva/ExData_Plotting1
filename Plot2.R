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

# Open the png device and create plot

png("Plot2.png",width=480,height=480,units = "px")

plot(data$DateTime,data$Global_active_power,type = "l", ylab="Global Active Power(kilowatts)",xlab="")

#close the device
dev.off()
