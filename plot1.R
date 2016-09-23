Origin_data <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",na.strings='?')
Target_data <- subset(Origin_data, as.Date(Date,"%d/%m/%Y") >= "2007-02-01" & as.Date(Date,"%d/%m/%Y") <= "2007-02-02")

png(filename = "plot1.png",width = 480, height = 480, units = "px")
with(Target_data,hist(Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.off()
