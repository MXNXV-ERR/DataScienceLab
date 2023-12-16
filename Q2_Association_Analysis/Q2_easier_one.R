#association rule mining
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
data("Groceries")#present in arules
summary(Groceries)
head(Groceries)

data<-Groceries
#model
rules<-apriori(data,parameter=list(support=0.0004,confidence=0.2))

itemFrequencyPlot(data,topN=10)
plot(rules,method = "graph",  
     measure = "confidence", shading = "lift")