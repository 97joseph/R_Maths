#Libraries Import
library(agridat)  
library(ggplot2)  
library(moments)  
library(pscl)  
library(MuMIn)  

#Load the  Data
SleepData <- read.csv("E:/ONLINE WORKING/R_Maths/SleepData.txt", sep="")
View(SleepData)

#This will give us the structure of our data

print(SleepData)

#Anaysis of Loaded Data

summary(SleepData)

#Frequency Analysis of the Basis

frequency(SleepData)

install.packages("mgcv")  
library(mgcv)  
#Graphing of Treatment and Related Hours
ts.plot(SleepData, xlab="Treatment", ylab="Hours", main="SleepTotals")
