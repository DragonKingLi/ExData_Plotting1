# this is for plot 4

rm(list=ls())

#read in data

org_data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character",na.string="?")
org_data$Date<-as.Date(org_data$Date, "%d/%m/%Y")
Subdata<-subset(org_data, org_data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"))
Subdata$datetime<-strptime(paste(Subdata$Date, Subdata$Time), "%Y-%m-%d %H:%M:%S")
strptime("20/2/06 11:16:16.683", "%d/%m/%y %H:%M:%S")
Subdata$Global_active_power=as.numeric(Subdata$Global_active_power)
Subdata$Global_reactive_power=as.numeric(Subdata$Global_reactive_power)
Subdata$Voltage=as.numeric(Subdata$Voltage)
Subdata$Sub_metering_1=as.numeric(Subdata$Sub_metering_1)
Subdata$Sub_metering_2=as.numeric(Subdata$Sub_metering_2)
Subdata$Sub_metering_3=as.numeric(Subdata$Sub_metering_3)

pgn("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,0.1,1))
with(Subdata,{
  plot(datetime, Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(datetime, Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(datetime,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2,col="red")
  lines(datetime, Sub_metering_3,col="blue")
  legend("topright",lwd=2,col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7,bty="n")
  plot(datetime, Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")
})


dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()