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
y<-data$Global_active_power
plot(x,y,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
