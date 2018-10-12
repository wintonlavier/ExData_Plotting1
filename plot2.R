household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date<-as.Date(strptime(household_power_consumption$Date,"%d/%m/%Y"))

hcp<-household_power_consumption[household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02",]
hcp$DateTime<-as.POSIXct(paste(hcp$Date, as.character(hcp$Time),"%H:%M:%S"), format="%Y-%m-%d %H:%M:%S")


png(file="plot2.png")
plot(hcp$DateTime,as.character(hcp$Global_active_power),type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(hcp$DateTime,as.character(hcp$Global_active_power))
dev.off()