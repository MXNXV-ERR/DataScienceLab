# Installing package 
install.packages("caTools")       # For sampling the dataset 
install.packages("randomForest")  # For implementing random forest algorithm 

# Loading package 
library(caTools) 
library(randomForest) 


# Loading data 
data(iris) 

# Structure  
str(iris) 

# Splitting data in train and test data 
split <- sample.split(iris, SplitRatio = 0.7) 
split 

train <- subset(iris, split == "TRUE") 
test <- subset(iris, split == "FALSE") 

# Fitting Random Forest to the train dataset 
set.seed(120)  # Setting seed 
classifier_RF = randomForest(x = train[-5], 
                             y = train$Species, 
                             ntree = 500) 

classifier_RF 

# Predicting the Test set results 
y_pred = predict(classifier_RF, newdata = test[-5]) 

# Confusion Matrix 
confusion_mtx = table(test[, 5], y_pred) 
confusion_mtx 

# Plotting model 
plot(classifier_RF) 

# Importance plot 
importance(classifier_RF) 

# Variable importance plot 
varImpPlot(classifier_RF) 

