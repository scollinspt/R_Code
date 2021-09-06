# Packages to install with an R or R studio upgrade or new computer installation
# Package management for updating new installations and different computers in sync

setwd("~/R_code/package_management")

#Current list of installed packages:

list.of.packages<-read.table("currentPackages.txt")

# Need code to convert list.of.packages as a data frame to a list
# For now manipulate in a text file (replace \n with , in BBedit) and paste into this:

list.of.packages<-(c("abind","acepack","askpass","assertthat","backports","base","base64enc","BayesFactor","bayesplot","BDgraph","BH","bibtex","bit","bit64","bitops","blavaan","blob","blogdown","bookdown","boot","brio","broom","cachem","callr","cellranger","checkmate","class","cli","clipr","cluster","coda","codetools","coin","colorspace","colourpicker","commonmark","compiler","CompQuadForm","contfrac","corpcor","cpp11","crayon","crosstalk","curl","d3Network","dagitty","data.table","datasets","DBI","dbplyr","desc","DescTools","deSolve","diffobj","digest","dplyr","DT","dtplyr","dygraphs","ellipsis","elliptic","emmeans","EMT","estimability","evaluate","expm","fansi","fastmap","fdrtool","forcats","foreign","Formula","fs","future","future.apply","gargle","generics","ggcorrplot","ggm","ggplot2","ggridges","ggsoccer","glasso","globals","glue","googledrive","googlesheets4","graphics","grDevices","grid","gridExtra","gtable","gtools","haven","highr","HistData","Hmisc","hms","htmlTable","htmltools","htmlwidgets","httpuv","httr","huge","huxtable","hypergeo","ids","igraph","inline","isoband","jpeg","jsonlite","jtools","KernSmooth","knitr","labeling","later","lattice","latticeExtra","lavaan","lazyeval","libcoin","lifecycle","listenv","lme4","lmerTest","lmtest","loo","lubridate","magrittr","markdown","MASS","Matrix","MatrixModels","matrixStats","mcmc","MCMCpack","memoise","methods","mgcv","mime","miniUI","minqa","mnormt","modelr","modeltools","multcomp","multcompView","multicmp","MuMIn","munsell","mvtnorm","naniar","nFactors","nlme","nloptr","nnet","nonnest2","norm","nortest","numDeriv","nycflights13","openssl","packrat","pander","parallel","pbapply","pbivnorm","pillar","pkgbuild","pkgconfig","pkgload","plogr","plotly","plyr","png","ppcor","praise","prettyunits","printr","processx","progress","promises","ps","psych","psycho","purrr","qgraph","quantreg","R6","rappdirs","RColorBrewer","rcompanion","Rcpp","RcppEigen","RCurl","readr","readxl","RefManageR","rematch","rematch2","reprex","reshape2","rjson","rlang","rmarkdown","rpart","rprojroot","rsconnect","rstan","rstanarm","rstantools","rstudioapi","rticles","rvest","sandwich","scales","selectr","servr","shiny","shinyjs","shinystan","shinythemes","sourcetools","SparseM","spatial","splines","StanHeaders","stargazer","stats","stats4","stringi","stringr","survival","swirl","sys","tcltk","testthat","TH.data","threejs","tibble","tidyr","tidyselect","tidyverse","tinytex","tools","tzdb","UpSetR","UsingR","utf8","utils","uuid","V8","vctrs","viridis","viridisLite","visdat","vroom","waldo","whisker","withr","xfun","xml2","xtable","xts","yaml","zeallot","zoo"))

#Checking what is installed and installing what is missing:
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


#Creating a list of currently installed packages and exporting as a text file
current.packages<-installed.packages()[,"Package"]
current.packages<-as.data.frame(current.packages)
write.table(current.packages,"~/R_code/package_management/currentPackages.txt",row.names=FALSE,col.names=FALSE,sep=",")
