for(x in 1:10)
  print(x)

x <- c(5,7,8,7,2,2,9,4,11,12,9,6)
y <- c(99,86,87,88,111,103,87,94,78,77,85,86)


plot(1, 3) 
plot(x, y) 

plot(1:10, type="l") 

data1 <- read.csv(file.choose(), header=T)
print(data1)

df<-data.frame(Gender)

install.packages("ggplot2") # If not already installed
library(ggplot2)

ggplot(data1,aes(x=Gender,fill=Level.of.Education))+
  geom_bar(position='dodge')+
  labs(title='Gender vs LOE')
