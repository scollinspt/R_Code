setwd("/Users/collins/Dropbox/HockeyProject/FirstBeatData")

`T130` <- read.delim("~/Dropbox/HockeyProject/FirstBeatData/T130.txt")
trimpDate <- as.Date(T130$date)
T130$trimpDate <- trimpDate
days = nrow(T130)
span <- as.numeric(difftime(T130$trimpDate[days], T130$trimpDate[1]))
trimpDate <- seq(0,span)
trimpDate <- trimpDate + T130$trimpDate[1]
trimpDate <- data.frame(trimpDate)
T130 <- merge(T130, trimpDate, by="trimpDate", all.x=TRUE, all.y=TRUE)
T130$TRIMPIndex_mean[is.na(T130$TRIMPIndex_mean)] <- 0
T130$series <- 0:span
write.csv(T130, file = "T130.csv")

