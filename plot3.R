# this is for plot 3

rm(list=ls())

#read in data

org_data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character",na.string="?")
org_data$Date<-as.Date(org_data$Date, "%d/%m/%Y")
Subdata<-subset(org_data, org_data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"))
Subdata$datetime<-strptime(paste(Subdata$Date, Subdata$Time), "%Y-%m-%d %H:%M:%S")
strptime("20/2/06 11:16:16.683", "%d/%m/%y %H:%M:%S")
Sub_metering_1=as.numeric(Subdata$Sub_metering_1)
Sub_metering_2=as.numeric(Subdata$Sub_metering_2)
Sub_metering_3=as.numeric(Subdata$Sub_metering_3)

plot(Subdata$datetime,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(Subdata$datetime, Sub_metering_2,col="red")
lines(Subdata$datetime, Sub_metering_3,col="blue")
legend("topright",lwd=1,col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)

dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()

