setwd("~/R_code/numericalPlayground")
x<-(1:100)
x3<-x^3
x_name <- "integers"
x3_name <- "cubes"
perfectCubes <- data.frame(x,x3)
names(perfectCubes) <- c(x_name,x3_name)

write.csv(perfectCubes, file = "perfectCubes.csv", row.names=FALSE)
