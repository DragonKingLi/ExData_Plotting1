# this is for plot 2

rm(list=ls())

#read in data

org_data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character",na.string="?")
org_data$Date<-as.Date(org_data$Date, "%d/%m/%Y")
Subdata<-subset(org_data, org_data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"))
Subdata$datetime<-strptime(paste(Subdata$Date, Subdata$Time), "%Y-%m-%d %H:%M:%S")
strptime("20/2/06 11:16:16.683", "%d/%m/%y %H:%M:%S")
Global_active_power=as.numeric(Subdata$Global_active_power)

plot(Subdata$datetime, Global_active_power,type="l",xlab="",ylab="Global Active Power (killowatts)")
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()