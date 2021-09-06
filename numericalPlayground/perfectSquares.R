setwd("~/R_code/numericalPlayground")
x<-(1:100)
x2<-x^2
x_name <- "integers"
x2_name <- "squares"
perfectSquares <- data.frame(x,x2)
names(perfectSquares) <- c(x_name,x2_name)

write.csv(perfectSquares, file = "perfectSquares.csv", row.names=FALSE)
