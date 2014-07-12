## load the dataset
setwd("~/Desktop/Coursera/4-graphics/project 1")
colclasses=c("character","character",rep("numeric",7))
data<-read.csv("household_power_consumption.txt",colClasses=colclasses,na.strings=c("?"),sep=";")
data<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

## draw the plot on screen 
x<-data$Global_active_power
hist(x,breaks=20,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

## copy the plot and save it as a png file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

