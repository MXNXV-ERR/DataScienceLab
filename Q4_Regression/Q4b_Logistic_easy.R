#logistic regression
library(dplyr)
library(ROCR)#for ROC AUC
library(caTools)#for split
#for mtcars dataset use dplyr
dim(mtcars)
head(mtcars)
colnames(mtcars)

split<- sample.split(mtcars$vs,SplitRatio = 0.7)#vs is target variable
training<-subset(mtcars,split==TRUE)
testing<-subset(mtcars,split==FALSE)

#model
model<-glm(
  formula=vs~wt+disp,data = mtcars, 
  family =  binomial(link="logit"))#input variables are wt and disp

summary(model)
coef(model)

predns <- predict(model,testing)
predns #you get probs

predns <- ifelse(predns>0.5,1,0)
predns

table(predns,testing$vs)
ROCPred <- prediction(predns, testing$vs)  

ROCPer <- performance(ROCPred, measure = "tpr",  x.measure = "fpr") 

auc <- performance(ROCPred, measure = "auc") 

auc <- auc@y.values[[1]] 
plot(ROCPer)