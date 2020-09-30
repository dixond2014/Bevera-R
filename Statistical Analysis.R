
#View the cars dataset
View(cars)
#Find the structure of cars
str(cars)

#Find the range of the two variables in the dataset.
summary(cars)

plot(cars$speed,cars$distance)

#purpose of standardization, R has a built-in command scale().

scale(x, center = TRUE, scale = TRUE)
#"x" refers to the object you are rescaling (which can be any numeric object).
#The "center" parameter (when set to TRUE) is responsible for subtracting the mean on the numeric object from each observation.
#The "scale" parameter (when set to TRUE) is responsible for dividing the resulting difference by the standard deviation of the numeric object.
cars$speed_scaled<-scale(cars$speed)
cars$dist_scaled<-scale(cars$dist)

#Look at the data
head()
View()

#Visualization of standardized data in R
plot(cars$speed_scaled,cars$distance_scaled)
#the difference is the scales of axis and the weight assigned to outliers.


#Normalizing Data
#Loading sample dataset: cars
#Creating a function to normalize data in R
#Normalize data in R
#Visualization of normalized data in R

#basic statistics
summary(cars)
#The ranges for these two variables are significantly different from each 
#other, and therefore may affect the performance of "distance" sensitive algorithms. 

hist(cars$speed)
hist(cars$dist)

#defining normalize()
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

cars$speed_norm <-normalize(cars$speed)
cars$dist_norm <-normalize(cars$dist)
View(cars)

#The best way to show the changes is to visualize the dataset.
#Creating a histogram
#comparing a normalize set vs. not normalized set
hist(cars$speed_norm)
hist(cars$dist_norm)

#We see identical histograms even though the X axis is rescaled.
#End 


#creating data with bar chart adding counts on top of bars
set.seed(27222)                                                             # Create random example 
data <- data.frame(x = sample(LETTERS[1:5], 100, replace = TRUE)) 
head(data)                                                                       # Print first lines of data

#Install.packages("ggplot2")
library("ggplot2")

data_srz <- as.data.frame(table(data$x))                  # Summarize data
data_srz                                                                           # Print summarized data

ggplot(data_srz, aes(x = Var1, y = Freq, fill = Var1)) + geom_bar(stat = "identity") + geom_text(aes(label = Freq), vjust=0)
  
#Define Sample 
smp2014 <- c(222,823,1092,400,948,836)
#Define Sample 2
smp2019 <- c(910,650,700,892,229,1051)

#Two sample T-test
t.test(smp2014, smp2018, var.equal=FALSE)

#What is the p-value?

#Run T-test of Equal Variance
t.test(smp2014, smp2019, var.equal=TRUE)
