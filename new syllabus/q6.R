data=data.frame(
  customer_id=1:100,
  age=sample(20:70, 100, replace=TRUE),
  income=rnorm(100, mean=50000,sd=10000),
  savings=rnorm(100,mean=20000, sd=500),
  credit_score=sample(300:850,100,replace=TRUE)
)

set.seed(456)
model=randomForest(credit_score ~ .,data=data)
print(model)
pred=predict(model,data)
pred
plot(model)
summary(model)
importance(model)
varImpPlot(model)