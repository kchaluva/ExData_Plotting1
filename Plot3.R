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

png("Plot3.png",width=480,height=480,units = "px")

plot(data$Sub_metering_1~data$DateTime,type="l",xlab="",ylab="Energy sub meetering")
lines(data$Sub_metering_2~data$DateTime,col="red")
lines(data$Sub_metering_3~data$DateTime,col="blue")
legend(x="topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd = 2)

#close the device
dev.off()
