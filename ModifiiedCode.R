#Libraries Import
library(agridat)  
library(ggplot2)  
library(moments)  
library(pscl)  
library(MuMIn)  
library(gam)
library(car)


#Load the  Data
SleepData <- read.csv("E:/ONLINE WORKING/R_Maths/SleepData.txt", sep="")
View(SleepData)

#This will give us the structure of our data

print(SleepData)

#Anaysis of Loaded Data

summary(SleepData)

#Frequency Analysis of the Basis

frequency(SleepData)

#Structure of DATA

# Simple Histogram
hist(SleepData$Hours)
hist(SleepData$Treatment)
hist(SleepData$Individual)

#Distribution Fixes
# Add a Normal Curve 
x <- SleepData$Hours
h<-hist(x, breaks=5, col="red", xlab="Hours",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=100)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)

x <- SleepData$Individual
h<-hist(x, breaks=5, col="red", xlab="Individual",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=5)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)

x <- SleepData$Treatment
h<-hist(x, breaks=5, col="red", xlab="Treatment",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=5)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)


#Graphing of Treatment and Related Hours
ts.plot(SleepData, xlab="Hours", ylab="Treatment", main="SleepTotals")

#Part(a)
#MOdelling using Graphing Algorithms
ggplot(data=SleepData, aes(x="Hours", y="Treatment")) +  
  geom_point(aes(col="Individual"))  +  
  geom_smooth(method = "lm", se = F, col="red")+  
  geom_smooth(method="gam", formula=y~s(x), se = F, col="blue") +  
  stat_smooth(method="lm", formula=yield~x+I(x^2),se = F, col="green")  

#SCATTER PLOT OF VARIABLE
x <- SleepData$Hours
y <- SleepData$Individual

          # Plot with main and axis titles

          # Change point shape (pch = 19) and remove frame.

plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
          # Add regression line
plot(x, y, main = "ScatterPlot of Hours and Treatment",
     xlab = "Hours", ylab = "Individuals",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = SleepData), col = "blue")

#Enhanced Analysis
scatterplot(Hours ~ Individual, data = SleepData)

