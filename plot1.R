household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
household_power_consumption$Date<-as.Date(strptime(household_power_consumption$Date,"%d/%m/%Y"))
hcp<-household_power_consumption[household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02",]
png(file="plot1.png")
hist(as.numeric(as.character(hcp$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()