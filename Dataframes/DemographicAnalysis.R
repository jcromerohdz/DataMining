?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

# Method 2: Set Working Directory and Read Data
getwd()
#windows
setwd("C:\\Users\\username\\Documents\\Rprojects")
#Mac
setwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/Dataframes
")
getwd()
rm(stats)
stats <- read.csv("Demographic-Data.csv")
stats
