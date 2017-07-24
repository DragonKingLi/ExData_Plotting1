# this is for plot 1

rm(list=ls())

#read in data

org_data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character",na.string="?")
org_data$Date<-as.Date(org_data$Date, "%d/%m/%Y")
Subdata<-subset(org_data, org_data$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"))
Global_active_power=as.numeric(Subdata$Global_active_power)

hist(Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()