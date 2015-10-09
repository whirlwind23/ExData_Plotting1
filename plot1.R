plot1<-function(){
dat<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat2<-subset(dat,dat$Date>="2007-02-01" & dat$Date<="2007-02-02")
DateTime<-paste(as.character(dat2$Date),dat2$Time)
dat2$DateTime<-strptime(DateTime,"%Y-%m-%d %H:%M:%S")
png(filename="plot1.png")
hist(dat2$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power") ##plot1
dev.off()
}