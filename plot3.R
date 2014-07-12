## load the dataset
setwd("~/Desktop/Coursera/4-graphics/project 1")
colclasses=c("character","character",rep("numeric",7))
data<-read.csv("household_power_consumption.txt",colClasses=colclasses,na.strings=c("?"),sep=";")
data<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

## merge Date and Time
x<-NULL
for (i in 1:length(data$Time)) {
    x<-c(x,paste(data$Date[i],data$Time[i],sep=" "))
}

## plot and save the figure 
x<-strptime(x,"%d/%m/%Y %H:%M:%S")
z<-c(x,x,x)
y<-c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)
g<-gl(3,2880,labels=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
png(filename="plot3.png",width=480,height=480)
plot(z,y,xlab="",ylab="Energy sub mertering",type="n")
points(x,y[g=="Sub_metering_1"],col="black",type="l")
points(x,y[g=="Sub_metering_2"],col="red",type="l")
points(x,y[g=="Sub_metering_3"],col="blue",type="l")
legend("topright",lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()
