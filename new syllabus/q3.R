library(cluster)
library(ClusterR)
data <- data.frame(
  x=c(2,2,8,5,7,6,1,4,3),
  y=c(10,5,4,8,5,4,2,9,9)
)

model <- kmeans(data,centers = 3,nstart=20)
summary(model)
print(model$cluster)
clusplot(data,model$cluster)