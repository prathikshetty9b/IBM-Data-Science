#Loading Iris Dataset
library(datasets)
data(iris)
#Viewing Iris Dataset
View(iris)

#Checking Unique Species
unique(iris$Species)

#Installing Package
install.packages("GGally", repos = "https://cran.r-project.org", type= "source")

#Plotting with R Studio
library(GGally)
ggpairs(iris,mapping=ggplot2::aes(colour = Species))