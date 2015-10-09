plot3<-function(){
  dat<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
  dat2<-subset(dat,dat$Date>="2007-02-01" & dat$Date<="2007-02-02")
  DateTime<-paste(as.character(dat2$Date),dat2$Time)
  dat2$DateTime<-strptime(DateTime,"%Y-%m-%d %H:%M:%S")
  png(filename="plot3.png")
  plot(dat2$DateTime,dat2$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")##plot2
  lines(dat2$DateTime ,dat2$Sub_metering_2,col="red")
  lines(dat2$DateTime ,dat2$Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub metering 1", "Sub metering 2","Sub metering 3"),lty=c(1,1,1),lwd=c(2,2,2),col=c(1,2,4))
  dev.off()
}