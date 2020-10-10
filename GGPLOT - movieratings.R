library(ggplot2)
library(dplyr)
library(scales)
library(gt)
library(stringr)
library(googleVis)

getwd()

#eda
summary(movies)
colnames(movies)
str(movies)
head(movies)

factor(movies$Year)
movies$Year<-factor(movies$Year)


#aesthethic

q <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
q + geom_point(size=1)+ facet_grid(.~Year) + geom_smooth(fill=NA)

q + geom_line(size= 1) + geom_point() 
q +  geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 
#overriding

q + geom_point(aes(size=CriticRating))
q + geom_point(aes(colour=BudgetMillions))

q + geom_point(aes(x=BudgetMillions)) + xlab("Budget")

#-----------Mapping vs Setting
r <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
r + geom_point() + geom_smooth(fill=NA)

#1.Mapping + Geom_smooth
r + geom_point(aes(colour=Genre,size=BudgetMillions))
r + geom_point(colour="Dark Blue")

#2. Histogram and Density / Facets
l <- ggplot(data=movies)
l + geom_histogram(binwidth=12,aes(x=BudgetMillions,fill=Genre),colour="Black") + facet_grid(Genre~., scales = "free")
#3.Coordinates
#limits and zoom

q1 <- ggplot(data=movies,aes(x=BudgetMillions))
q1 + geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black") + xlim(0,100) + ylim(0,100)
q1 + geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black") + coord_cartesian((ylim=c(0,50)))

#-------------THEME (title,text,position) 

o <- ggplot(data=movies,aes(x=BudgetMillions))
o + geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black") + xlab("Money Axis") + ylab("Number of Movies") + ggtitle("Movie Budget Distribution") +
theme(axis.title.y = element_text(colour = "red",size=10),axis.title.x = element_text(colour='darkgreen',size=10),
      axis.text.x = element_text(size=10), axis.text.y = element_text(size=10), legend.title = element_text(size=15), legend.text = element_text(size=8),
      legend.position = c(1,1), legend.justification = c(0.1), plot.title = element_text(colour="darkblue",size=20, family = "Courier"))
 
                                                                                                                         