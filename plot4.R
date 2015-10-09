plot4<-function(){
  at<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
  dat2<-subset(dat,dat$Date>="2007-02-01" & dat$Date<="2007-02-02")
  DateTime<-paste(as.character(dat2$Date),dat2$Time)
  dat2$DateTime<-strptime(DateTime,"%Y-%m-%d %H:%M:%S")
  png(filename="plot4.png")
  par(mar=c(4,4,2,2),mfrow=c(2,2))
  plot(dat2$DateTime,dat2$Global_active_power,type="l",ylab="Global Active Power",xlab="") ##1
  
  ##2
  plot(dat2$DateTime,dat2$Voltage,type="l",ylab="Voltage",xlab="datetime")
  
  ##3
  plot(dat2$DateTime,dat2$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")##plot2
  lines(dat2$DateTime ,dat2$Sub_metering_2,col="red")
  lines(dat2$DateTime ,dat2$Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub metering 1", "Sub metering 2","Sub metering 3"),bty="n",lty=c(1,1,1),lwd=c(2,2,2),col=c(1,2,4))
  
  ##4
  
  plot(dat2$DateTime,dat2$Global_reactive_power,type="l",ylab="global_reactive_power",xlab="datetime")
  
  dev.off()
}
