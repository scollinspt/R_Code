# structural equation modeling code
# from: http://www.statmethods.net/advstats/factor.html

#Packages used
library(sem)

# Simple CFA Model
library(sem)
mydata.cov <- cov(mydata)
model.mydata <- specify.model() 
F1 ->  X1, lam1, NA
F1 ->  X2, lam2, NA 
F1 ->  X3, lam3, NA 
F2 ->  X4, lam4, NA 
F2 ->  X5, lam5, NA 
F2 ->  X6, lam6, NA 
X1 <-> X1, e1,   NA 
X2 <-> X2, e2,   NA 
X3 <-> X3, e3,   NA 
X4 <-> X4, e4,   NA 
X5 <-> X5, e5,   NA 
X6 <-> X6, e6,   NA 
F1 <-> F1, NA,    1 
F2 <-> F2, NA,    1 
F1 <-> F2, F1F2, NA

mydata.sem <- sem(model.mydata, mydata.cov, nrow(mydata))
# print results (fit indices, paramters, hypothesis tests) 
summary(mydata.sem)
# print standardized coefficients (loadings) 
std.coef(mydata.sem)