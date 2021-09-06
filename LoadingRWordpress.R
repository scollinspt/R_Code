# Need to install devtools to load a package from GitHub
install.packages("devtools")
library(devtools)


#Install dependency XMLRPC
install_github("duncantl/XMLRPC", username="duncantl")
#Install RWordPress
install_github("duncantl/RWordPress", username="duncantl")


#set global options
options(WordpressLogin = c(scollinsptscd = "Sean_9905"), WordpressURL = "https://knowledgebasedpractice.wordpress.com/xmlrpc.php")

# Load libraries required
library(RWordPress)
library(knitr)
setwd("~/R_code")
knit2wp("test.rmd", title = "R to WordPress Test", envir = parent.frame(),shortcode = TRUE, action = "newPost", encoding = getOption("encoding"), publish = FALSE)
