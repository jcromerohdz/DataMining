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


#----------------- Mapping vs Setting
r <- ggplot(movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# Add color
#1. Mapping (what we've done so far)
r + geom_point(aes(color = Genre))
#2. By Setting:
r + geom_point(color="DarkGreen")
# ERROR
r + geom_point(aes(color = "DarkGreen"))

#1. size by Mapping
r + geom_point(aes(size=BudgetMillions))
#2. size by Setting
r + geom_point(size=10)
# ERROR
r + geom_point(aes(size=10))

#-------------- Histograms and Density Charts (Statistics)
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

# Add color
s + geom_histogram(binwidth =10, aes(fill=Genre))
# Add a border
s + geom_histogram(binwidth =10, aes(fill=Genre), color="Black")

# Density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = "stack")


#------------------ Starting Layer Tips

t <- ggplot(movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="White", color="Blue")   

#another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),
                   fill="White", color="Blue")

t + geom_histogram(binwidth=10,
                   aes(x=CriticRating),
                   fill="White", color="Blue")
t <- ggplot()

#-------------------- Statistical Transformation

?geom_smooth

u <- ggplot(movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(movies, aes(x=Genre, y=AudienceRating,
                        color=Genre))

u + geom_boxplot()  
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
# tip / hack
u + geom_boxplot(size=1.2) + geom_jitter()
# another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

#------------------ Using Facets
v <- ggplot(movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")
#Facets
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") + facet_grid(Genre~., scales="free")

#scatterplots:
w <- ggplot(movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre))


w + geom_point(size=3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(size=3) + 
  geom_smooth() + 
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() + 
  facet_grid(Genre~Year)

#------------ Coordinates
# Limits
m <- ggplot(movies, aes(x=CriticRating, y=AudienceRating,
                        size=BudgetMillions,
                        color=Genre))

m + geom_point()

m + geom_point() + xlim(50,100) + ylim(50, 100)

# No work well always

n <- ggplot(movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") + ylim(0, 50)

#instead -> zoom
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black") +
  coord_cartesian(ylim=c(0, 50))

w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() + 
  facet_grid(Genre~Year) + 
  coord_cartesian(ylim=c(0,100))

#-------------- Theme
o <- ggplot(movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

h

#axes labels
h + xlab("Money Axis") + ylab("Number of Movies")

#label formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=30),
        axis.title.y = element_text(color = "Red", size=30))

#tick mark formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=30),
        axis.title.y = element_text(color = "Red", size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))
 
?theme

#Legend formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=30),
        axis.title.y = element_text(color = "Red", size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#Title of the plot
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=30),
        axis.title.y = element_text(color = "Red", size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color = "DarkBlue",
                                  size = 25,
                                  family = "Courier"))
