# factor analysis code
# from: http://www.statmethods.net/advstats/factor.html

#Packages used
library(psych)

# Principal Components Analysis
# entering raw data and extracting PCs 
# from the correlation matrix 
fit <- princomp(mydata, cor=TRUE)
summary(fit) # print variance accounted for 
loadings(fit) # pc loadings 
plot(fit,type="lines") # scree plot 
fit$scores # the principal components
biplot(fit)

# Varimax Rotated Principal Components
# retaining 5 components 
library(psych)
fit <- principal(mydata, nfactors=5, rotate="varimax")
fit # print results


# Exploratory Factor Analysis
# Maximum Likelihood Factor Analysis
# entering raw data and extracting 3 factors, 
# with varimax rotation 
fit <- factanal(mydata, 3, rotation="varimax")
print(fit, digits=2, cutoff=.3, sort=TRUE)
# plot factor 1 by factor 2 
load <- fit$loadings[,1:2] 
plot(load,type="n") # set up plot 
text(load,labels=names(mydata),cex=.7) # add variable names

# Principal Axis Factor Analysis
library(psych)
fit <- factor.pa(mydata, nfactors=3, rotation="varimax")
fit # print results

# Determine Number of Factors to Extract
library(nFactors)
ev <- eigen(cor(mydata)) # get eigenvalues
ap <- parallel(subject=nrow(mydata),var=ncol(mydata),rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

# PCA Variable Factor Map 
library(FactoMineR)
result <- PCA(mydata) # graphs generated automatically


