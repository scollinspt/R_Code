# descriptive statistics
# from: http://www.statmethods.net/stats/descriptives.html

#Packages used
library(Hmisc)
library(pastecs)
library(psych)
library(doBy)

# get means for variables in data frame mydata
# excluding missing values 
sapply(mydata, mean, na.rm=TRUE)

# mean,median,25th and 75th quartiles,min,max
summary(mydata)

# Tukey min,lower-hinge, median,upper-hinge,max
fivenum(x)

library(Hmisc)
describe(mydata) 
# n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles 
# 5 lowest and 5 highest scores

library(pastecs)
stat.desc(mydata) 
# nbr.val, nbr.null, nbr.na, min max, range, sum, 
# median, mean, SE.mean, CI.mean, var, std.dev, coef.var

library(psych)
describe(mydata)
# item name ,item number, nvalid, mean, sd, 
# median, mad, min, max, skew, kurtosis, se

library(psych)
describe.by(mydata, group,...)

library(doBy)
summaryBy(mpg + wt ~ cyl + vs, data = mtcars, 
          FUN = function(x) { c(m = mean(x), s = sd(x)) } )
# produces mpg.m wt.m mpg.s wt.s for each 
# combination of the levels of cyl and vs
