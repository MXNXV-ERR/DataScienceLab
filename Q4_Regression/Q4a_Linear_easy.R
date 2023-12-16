#linear regression
library(ggplot2)
library(caTools)
library(Metrics)

dataset<-read_excel("/dataset.xlsx")
dim(dataset)
head(dataset)
colnames(dataset)

ggplot(dataset)+geom_point(aes(x=temp,y=sales))

split <- sample.split(dataset$sales,SplitRatio=0.7)
training<-subset(dataset,split==TRUE)
test <- subset(dataset,split==FALSE)
test

model = lm(formula=sales~temp,dataset)
summary(model)
coef(model)

predns <- predict(model,test)
predns
rmse(test$sales,predns)

ggplot()+geom_point(aes(x=training$temp,y=training$sales))+
  geom_line(aes(x=training$temp,y=predict(model,training)))