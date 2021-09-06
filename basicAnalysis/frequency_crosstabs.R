# frequencies and crosstabs
# from: http://www.statmethods.net/stats/frequencies.html

#Packages used
library(gmodels)
library(vcd)
library(ca)

# 2-Way Frequency Table 
attach(mydata)
mytable <- table(A,B) # A will be rows, B will be columns 
mytable # print table 

margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages 
prop.table(mytable, 2) # column percentages

# 3-Way Frequency Table 
mytable <- table(A, B, C) 
ftable(mytable)


# The xtabs( ) function allows you to create crosstabulations using formula style input.
# 3-Way Frequency Table
mytable <- xtabs(~A+B+c, data=mydata)
ftable(mytable) # print table 
summary(mytable) # chi-square test of indepedence

#The CrossTable( ) function in the gmodels package produces crosstabulations modeled after PROC FREQ in SAS or CROSSTABS in SPSS. It has a wealth of options.
# 2-Way Cross Tabulation
library(gmodels)
CrossTable(mydata$myrowvar, mydata$mycolvar)

#Loglinear Models
#You can use the loglm( ) function in the MASS package to produce log-linear models. For example, let's assume we have a 3-way contingency table based on variables A, B, and C.
library(MASS)
mytable <- xtabs(~A+B+C, data=mydata)

# Mutual Independence: A, B, and C are pairwise independent.
loglm(~A+B+C, mytable)

#Partial Independence: A is partially independent of B and C (i.e., A is independent of the composite variable BC).
loglin(~A+B+C+B*C, mytable)

#Conditional Independence: A is independent of B, given C.
loglm(~A+B+C+A*C+B*C, mytable)

#No Three-Way Interaction
loglm(~A+B+C+A*B+A*C+B*C, mytable)

#Measures of Association
#The assocstats(mytable) function in the vcd package calculates the phi coefficient, contingency coefficient, and Cramer's V for an rxc table. The kappa(mytable) function in the vcd package calculates Cohen's kappa and weighted kappa for a confusion matrix. See Richard Darlington's article on Measures of Association in Crosstab Tables for an excellent review of these statistics. http://node101.psych.cornell.edu/Darlington/crosstab/TABLE0.HTM

library(vcd)
assocstats(mytable)
kappa(mytable)

#Visualizing results
#Use bar and pie charts for visualizing frequencies in one dimension.
#Use the vcd package for visualizing relationships among categorical data (e.g. mosaic and association plots).

#Use the ca package for correspondence analysis (visually exploring relationships between rows and columns in contingency tables).

