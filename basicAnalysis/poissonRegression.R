# Poisson regression model code

# Packages used

# Poisson Regression
# where count is a count and 
# x1-x3 are continuous predictors 
fit <- glm(count ~ x1+x2+x3, data=mydata, family=poisson())
summary(fit) #display results