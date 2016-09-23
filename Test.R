library(XML)
library(jsonlite)
library(data.table)
library(RMySQL)
library(rhdf5)
library(httr)
library(swirl)
library(dplyr)
library(Hmisc)
library(reshape2)
library(curl)
library(stringr)
library(lubridate)
library(ggplot2)

#######################w1l1###########################
download.file("https://raw.githubusercontent.com/simon19891101/courses/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv","Data/avgpm25.csv")
pollution <- read.csv("Data/avgpm25.csv")
head(pollution)

boxplot(pollution$pm25)
hist(pollution$pm25,breaks = 20)
rug(pollution$pm25)
abline(v=median(pollution$pm25),h=50, col="red",lwd=2)
barplot(table(pollution$region),col="darkgreen")
boxplot(pm25~region,data = pollution)

par(mfrow=c(2,1),mar=c(4,4,2,1))
hist(pollution[which(pollution$region=="west"),"pm25"])
abline(v=median(pollution[which(pollution$region=="west"),"pm25"]))
hist(subset(pollution,region=="east")$pm25)#filter(pollution,region=="east")$pm25
abline(v=median(subset(pollution,region=="east")$pm25))

plot(pollution$latitude,pollution$pm25,col=pollution$region)#color by region, interesting
with(pollution,plot(latitude,pm25,col=region))#very useful

data(mpg)
head(mpg)
qplot(displ,hwy,data = mpg)
with(mpg,qplot(displ,hwy))
par("pch")#call global pch setting
with(airquality,plot(Wind,Ozone,main="Ozone and wind in NYC",col=Month))
with(subset(airquality,Month == 5),points(Wind,Ozone,col="red"))
model <- with(airquality,lm(Ozone~Wind))
abline(model)

par(mfrow = c(1,2))
model1 <- with(airquality,lm(Ozone~Wind))
model2 <- with(airquality,lm(Solar.R~Wind))
with(airquality,{
  plot(Wind,Ozone,main="Ozone and wind in NYC",col=Month)
  abline(model1)
  plot(Wind,Solar.R, main="Solar and wind in NYC",col=Month)
  abline(model2)
})


