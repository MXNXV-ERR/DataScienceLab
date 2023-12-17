library(cluster)
library(ClusterR)
data <- data.frame(
  x=c(1,1,7,4,6,5,1,4,3),
  y=c(9,6,3,8,6,5,2,9,9)
)

model <- kmeans(data,centers = 3,nstart=20)
summary(model)
print(model$cluster)
clusplot(data,model$cluster)
