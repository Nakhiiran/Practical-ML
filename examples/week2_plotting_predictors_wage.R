library(ISLR)
library(ggplot2)
library(caret)
library(Hmisc)

data(Wage)

summary(Wage)

inTrain <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)

training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

print(dim(training))
print(dim(testing))

featurePlot(x=training[,c("age","education","jobclass")],y=training$wage,plot="pairs")

qplot(age,wage,data=training)

# Color by some class
qplot(age,wage,data=training,colour=jobclass)

# Add regression smoothers
qq <- qplot(age,wage,data=training,colour=jobclass)
qq + geom_smooth(method='lm', formula=y~x)

# Break the data (observations) into quantile groups (3)
cutWage <- cut2(training$wage, g=3)
print(table(cutWage))

# Qplot tutorial http://blog.echen.me/2012/01/17/quick-introduction-to-ggplot2/
# qplot(x,y,data=dataset,color=z,size=w,...)
p1 <- qplot(cutWage,age,data=training,fill=cutWage,geom=c("boxplot"))
p1





