set.seed(8212)                          # Set Seed for reproducibility
N <- 500                                 # Sample size

x1 <- round(rnorm(N, 1, 20))             # Create 5 random variables
x2 <- round(runif(N, 5, 10))
x3 <- round(runif(N, 1, 4), 1)
x4 <- round(runif(N, 5, 50))
x5 <- rpois(N, 5)

data <- data.frame(x1, x2, x3, x4, x5)   # Data frame with 5 columns
head(data)                               # First 6 rows of data.frame

mean(data$x4)
min(x3)

#standardization
set.seed(272)
X =data.frame(k1 = sample(100:1000,1000, replace=TRUE),k2 = sample(10:100,1000, replace=TRUE))
X.scaled = scale(X, center= TRUE, scale=TRUE)

#3. Standard Deviation Method
X.scaled = data.frame(scale(X, center= FALSE , scale=apply(X, 2, sd, na.rm = TRUE)))
#Check Equal Variance
summarise_all(X.scaled, var)

#4. range 
library(dplyr)
rng = as.integer(summarise_all(X, function(x) diff(range(x))))
X.scaled = data.frame(scale(X, center= FALSE, scale=rng))

#centering
X=sample(1:100,1000, replace=TRUE)
scale(X,center = TRUE, scale=FALSE)
#By default, scale() function with center=TRUE subtract mean value from values of a variable.
summarise_all(X.scaled, var)
#Check Min and Max of standardized variables
summarise_all(X.scaled, funs(min, max))


