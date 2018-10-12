household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date<-as.Date(strptime(household_power_consumption$Date,"%d/%m/%Y"))

hcp<-household_power_consumption[household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02",]
hcp$DateTime<-as.POSIXct(paste(hcp$Date, as.character(hcp$Time),"%H:%M:%S"), format="%Y-%m-%d %H:%M:%S")


png(file="plot3.png")
plot(hcp$DateTime,as.character(hcp$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering")
lines(hcp$DateTime,as.character(hcp$Sub_metering_1))
lines(hcp$DateTime,as.character(hcp$Sub_metering_2),col="red")
lines(hcp$DateTime,as.character(hcp$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()