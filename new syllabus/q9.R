library(dplyr)
library(ggplot2)
data <- data.frame(
  x=c(1,1,7,4,6,5,1,4,3),
  y=c(9,6,3,8,6,5,2,9,9)
)
d_mat <- dist(data,method = "euclidean")
d_mat
model <- hclust (d_mat,method = "average")
summary(model)
plot(model)
rect.hclust(model,k=3)
fit <- cutree(model,k=3)
print(fit)

