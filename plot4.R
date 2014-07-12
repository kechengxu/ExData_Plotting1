## load the dataset
setwd("~/Desktop/Coursera/4-graphics/project 1")
colclasses=c("character","character",rep("numeric",7))
data<-read.csv("household_power_consumption.txt",colClasses=colclasses,na.strings=c("?"),sep=";")
data<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

## draw the topleft plot
png(filename="plot4.png",width=480,height=480)
par(mfcol=c(2,2))
x<-NULL
for (i in 1:length(data$Time)) {
    x<-c(x,paste(data$Date[i],data$Time[i],sep=" "))
}
x<-strptime(x,"%d/%m/%Y %H:%M:%S")
y1<-data$Global_active_power
plot(x,y1,xlab="",ylab="Global Active Power (kilowatts)",type="l")

## draw the downleft plot
z<-c(x,x,x)
y2<-c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)
g<-gl(3,2880,labels=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(z,y2,xlab="",ylab="Energy sub mertering",type="n")
points(x,y2[g=="Sub_metering_1"],col="black",type="l")
points(x,y2[g=="Sub_metering_2"],col="red",type="l")
points(x,y2[g=="Sub_metering_3"],col="blue",type="l")
legend("topright",lty=1,bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

## draw the topright plot
y3<-data$Voltage
plot(x,y3,xlab="datetime",ylab="Voltage",type="l")

## draw the downright plot
y4<-data$Global_reactive_power
plot(x,y4,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()