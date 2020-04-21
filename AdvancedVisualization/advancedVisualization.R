getwd()
setwd("Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/AdvancedVisualization")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

#Convert numeric data to a factor
factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)
