#hclust
library(dplyr)
library(ggplot2)
library(ClusterR)
library(cluster)

head(mtcars)
colnames(mtcars)
dim(mtcars)
#step1: distmatrix
dist_matrix<-dist(mtcars,method='euclidean')
dist_matrix

#Agenes model
agnes_model<-agnes(dist_matrix)
summary(agnes_model)
plot(agnes_model)
#now to group into clusters
#let k be no of clusters
rect.hclust(agnes_model,k=3)
fit<-cutree(agnes_model,k=3)
print(fit)

#Diana_model
diana_model<-diana(dist_matrix)
summary(diana_model)
plot(diana_model)
#now to group into clusters
#let k be no of clusters
rect.hclust(diana_model,k=3)
fit<-cutree(diana_model,k=3)
print(fit)

