# ANOVA MANOVA code
# from: http://www.statmethods.net/stats/anova.html

# Packages used:
library(gplots)

# One Way Anova (Completely Randomized Design)
fit <- aov(y ~ A, data=mydataframe)

# Randomized Block Design (B is the blocking factor) 
fit <- aov(y ~ A + B, data=mydataframe)

# Two Way Factorial Design 
fit <- aov(y ~ A + B + A:B, data=mydataframe)
fit <- aov(y ~ A*B, data=mydataframe) # same thing

# Analysis of Covariance 
fit <- aov(y ~ A + x, data=mydataframe)

# One Within Factor
fit <- aov(y~A+Error(Subject/A),data=mydataframe)

# Two Within Factors W1 W2, Two Between Factors B1 B2 
fit <- aov(y~(W1*W2*B1*B2)+Error(Subject/(W1*W2))+(B1*B2),
           data=mydataframe)

#Diagnostic plots provide checks for heteroscedasticity, normality, and influential observerations.
layout(matrix(c(1,2,3,4),2,2)) # optional layout 
plot(fit) # diagnostic plots

#Evaluate Model Effects
summary(fit) # display Type I ANOVA table
drop1(fit,~.,test="F") # type III SS and F Tests

# Two-way Interaction Plot 
attach(mtcars)
gears <- factor(gears)
cyl <- factor(cyl)
interaction.plot(cyl, gear, mpg, type="b", col=c(1:3), 
                 leg.bty="o", leg.bg="beige", lwd=2, pch=c(18,24,22),	
                 xlab="Number of Cylinders", 
                 ylab="Mean Miles Per Gallon", 
                 main="Interaction Plot")

# Plot Means with Error Bars
library(gplots)
attach(mtcars)
cyl <- factor(cyl)
plotmeans(mpg~cyl,xlab="Number of Cylinders",
          ylab="Miles Per Gallon", main="Mean Plot\nwith 95% CI")

#MANOVA
# 2x2 Factorial MANOVA with 3 Dependent Variables. 
Y <- cbind(y1,y2,y3)
fit <- manova(Y ~ A*B)
summary(fit, test="Pillai")
