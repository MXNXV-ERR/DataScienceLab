library(cluster)
library(ClusterR)#capital C

head(iris)#inbuilt dataset

colnames(iris)
dim(iris)

attributes<-iris[,1:4]
target<-iris[,5]
kmeans_model<-kmeans(attributes,centers=3,nstart=20)
summary(kmeans_model)
print(kmeans_model$cluster)
cm<-table(target,kmeans_model$cluster)
cm
#plot
clusplot(iris,kmeans_model$cluster)