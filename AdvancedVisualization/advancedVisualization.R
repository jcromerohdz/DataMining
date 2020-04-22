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

# Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

# Add Geometry
ggplot(movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

# Add Color
ggplot(movies, aes(x=CriticRating, y=AudienceRating, 
                   color=Genre)) + 
  geom_point()

# Add Size
ggplot(movies, aes(x=CriticRating, y=AudienceRating, 
                   color=Genre, size=BudgetMillions)) + 
  geom_point()
#>>> This is #1 (we need to improve it)

# -------------------- Ploting With Layers
p <- ggplot(movies, aes(x=CriticRating, y=AudienceRating, 
                        color=Genre, size=BudgetMillions))
# points
p + geom_point()

# lines
p + geom_line()

# multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#------------------- Overriding Aesthetics
p2 <- ggplot(movies, aes(x=CriticRating, y=AudienceRating, 
                         color=Genre, size=BudgetMillions))
# add geom layer
p2 + geom_point()

# overriding aes
# example 1
p2 + geom_point(aes(size=CriticRating))

# example 2
p2 + geom_point(aes(color=BudgetMillions))

# p2 remains the same
p2 + geom_point()

# example 3
p2 + geom_point(aes(x=BudgetMillions)) 
p2 + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")

# example 4
p2 + geom_line() + geom_point()
# reduce line size
p2 + geom_line(size=1) + geom_point()
