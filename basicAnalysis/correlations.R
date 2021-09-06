# correlation analysis
# from: http://www.statmethods.net/stats/correlations.html

#Packages used
library(Hmisc)
library(polycor)
library(ggm)

# Correlations/covariances among numeric variables in 
# data frame mtcars. Use listwise deletion of missing data. 
cor(mtcars, use="complete.obs", method="kendall") 
cov(mtcars, use="complete.obs")


# Correlations with significance levels
library(Hmisc)
rcorr(x, type="pearson") # type can be pearson or spearman

#mtcars is a data frame 
rcorr(as.matrix(mtcars))

# Correlation matrix from mtcars
# with mpg, cyl, and disp as rows 
# and hp, drat, and wt as columns 
x <- mtcars[1:3]
y <- mtcars[4:6]
cor(x, y)

#Other Types of Correlations
# polychoric correlation
# x is a contingency table of counts
library(polycor)
polychor(x) 

# heterogeneous correlations in one matrix 
# pearson (numeric-numeric), 
# polyserial (numeric-ordinal), 
# and polychoric (ordinal-ordinal)
# x is a data frame with ordered factors 
# and numeric variables
library(polycor)
hetcor(x) 


# partial correlations
library(ggm)
data(mydata)
pcor(c("a", "b", "x", "y", "z"), var(mydata))
# partial corr between a and b controlling for x, y, z