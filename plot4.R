household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date<-as.Date(strptime(household_power_consumption$Date,"%d/%m/%Y"))

hcp<-household_power_consumption[household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02",]
hcp$DateTime<-as.POSIXct(paste(hcp$Date, as.character(hcp$Time),"%H:%M:%S"), format="%Y-%m-%d %H:%M:%S")


png(file="plot4.png")
par(mfrow=c(2,2))
plot(hcp$DateTime,as.character(hcp$Global_active_power),type="n",xlab="",ylab="Global Active Power")
lines(hcp$DateTime,as.character(hcp$Global_active_power))

plot(hcp$DateTime,as.character(hcp$Voltage),type="n",xlab="datetime",ylab="Voltage")
lines(hcp$DateTime,as.character(hcp$Voltage))



plot(hcp$DateTime,as.character(hcp$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering")
lines(hcp$DateTime,as.character(hcp$Sub_metering_1))
lines(hcp$DateTime,as.character(hcp$Sub_metering_2),col="red")
lines(hcp$DateTime,as.character(hcp$Sub_metering_3),col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")


plot(hcp$DateTime,as.character(hcp$Global_reactive_power),type="n",xlab="datetime",ylab="Global_reactive_power")
lines(hcp$DateTime,as.character(hcp$Global_reactive_power))
dev.off()