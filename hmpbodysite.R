
library(data.table)
library(ggplot2)
library(stringr)
d<-fread("./StzB-3000-54.csv",na.strings=c("<NA>","None","none","","NA","Not Specified", " "))
head(d)


removena <- Reduce("|", lapply(na.strings, "==", d))
is.na(d) <- removena

hmp<-d

hmp<-hmp[complete.cases(hmp[ , 11]),]
head(hmp)
fwrite(hmp,"gh88bodysite.csv")
 dim(hmp)
 
 colnames(d)[colnames(d)=="HMP Body Site"] <- "HMPBodySite"
 
###below: all for finding specific
string <- c("Skin")
string2<- c("Urogenital tract")
string3<-c("Airways")
string4<-c("Blood")

hmp

d$Skin <- 
  (1:nrow(d) %in% c(sapply(string, grep, d$HMPBodySite, fixed = TRUE)))+0
d$Urogenital <- 
  (1:nrow(d) %in% c(sapply(string2, grep, d$HMPBodySite, fixed = TRUE)))+0
d$Airways <- 
  (1:nrow(d) %in% c(sapply(string3, grep, d$HMPBodySite, fixed = TRUE)))+0
d$Blood <- 
  (1:nrow(d) %in% c(sapply(string4, grep, d$HMPBodySite, fixed = TRUE)))+0
d$Blood



airwaypathogen<-subset(d, Airways==1)
skinpathogen <- subset(d, Skin==1)
urogen<-subset(d,Urogenital==1)
Blood<-subset(d,Blood==1)
dim(Blood)

