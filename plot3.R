Origin_data <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings='?')
Target_data <- subset(Origin_data, as.Date(Date,"%d/%m/%Y") >= "2007-02-01" & as.Date(Date,"%d/%m/%Y") <= "2007-02-02")

png(filename = "plot3.png",width = 480, height = 480, units = "px")
with(Target_data,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
with(Target_data,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Sub_metering_2,type = "l",col="red"))
with(Target_data,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Sub_metering_3,type = "l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c(1,1,1))
dev.off()