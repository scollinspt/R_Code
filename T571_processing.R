setwd("/Users/collins/Dropbox/HockeyProject/FirstBeatData")

`T571` <- read.delim("~/Dropbox/HockeyProject/FirstBeatData/T571.txt")

trimpDate <- as.Date(T571$date)
T571$trimpDate <- trimpDate

days = nrow(T571)
span <- as.numeric(difftime(T571$trimpDate[days], T571$trimpDate[1]))

trimpDate <- seq(0,span)
trimpDate <- trimpDate + T571$trimpDate[1]
trimpDate <- data.frame(trimpDate)
T571 <- merge(T571, trimpDate, by="trimpDate", all.x=TRUE, all.y=TRUE)
T571$TRIMPIndex_mean[is.na(T571$TRIMPIndex_mean)] <- 0

