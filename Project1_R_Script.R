setwd("C:/Users/fenglizh/Documents/Coursera/ExploratoryDataAnalysis")
dt <- read.table(file="household_power_consumption2.txt", sep=";", header=T) 

#plot1.R
png(file="Plot1.png",width=480,height=480)
hist(dt$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
#mtext("Plot1", side=3, adj=-.1, line=1.2, cex=2, font=2);
dev.off()

#Plot2.R
datetime <- strptime(paste(dt$Date,dt$Time), format="%d/%m/%Y %H:%M:%S")
dt2 <- cbind(dt, datetime)
png(file="Plot2.png",width=480,height=480)
with(dt2, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 
dev.off()

#Plot3
png(file="Plot3.png",width=480,height=480)
with(dt2, plot(datetime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering"))
with(dt2, lines(datetime, Sub_metering_2, type="l", col = "red"))
with(dt2, lines(datetime, Sub_metering_3, type="l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty= "solid", inset = 0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()


#Plot4.R
png("Plot4.png", width=480, height=480)
par(mfrow=c(2,2)) # or layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))

#1
with(dt2, plot(datetime, Global_active_power, type="l", col = "black", xlab="", ylab="Global Active Power"))
#2
with(dt2, plot(datetime, Voltage, type="l", col = "black"))
#3
with(dt2, plot(datetime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering"))
with(dt2, lines(datetime, Sub_metering_2, type="l", col = "red"))
with(dt2, lines(datetime, Sub_metering_3, type="l", col = "blue"))
legend("topright", bty="n", col = c("black", "red", "blue"), lty= "solid", inset = 0.05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
#4
with(dt2, plot(datetime, Global_reactive_power, type="l", col = "black"))
dev.off()
