getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/SimpleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools)
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
