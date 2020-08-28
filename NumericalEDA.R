
## Needed libs for EDA
## Some may need to install these packages if this is their
## first time using R

library(dplyr)
library(ggplot2)
library(gapminder)
library(tidyr)
library(readr)
library(openintro)
options(scipen=999,digits=3)

## Download data from R using data() and see what the set is composed of
## Make sure you download data in the working directory

data("airquality")
str(airquality)

## To remove NA values, we use complete.cases() which will assign all NA as False,
## else, True.
complete.cases(airquality)

## To drop values option 1:
x <- airquality[complete.cases(airquality), ]
str(x)

## To drop values option 2:
y <- na.omit(airquality)
str(y)

## Making a dotplot to show numerical data. It's like a bar chart, 
## but with points stacked on top of each other
ggplot(y,aes(x=Solar.R)) + geom_dotplot(dotsize=0.4)

## Histogram combines the dots, and the y axis now shows the actual count
ggplot(y,aes(x=Solar.R)) + geom_histogram()

## The shape of the distribution can be better represented with a density plot, 
## without the stepwise nature of a histogram
ggplot(y,aes(x=Solar.R)) + geom_density()

## Another view of distribution where you use a boxplot
ggplot(y,aes(x=1,y=Solar.R)) + geom_boxplot() 

ggplot(y,aes(x=1,y=Solar.R)) + geom_boxplot() + coord_flip()

## Temperature faceted by wind speeds
ggplot(y,aes(x=Temp)) + geom_histogram() + facet_wrap(~Wind)



