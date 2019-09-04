
library(data.table)
library(ggplot2)
library(stringr)
d<-fread("./StzB-3000-54.csv",na.strings=c("<NA>","None","none","","NA","Not Specified", " "))
head(d)


removena <- Reduce("|", lapply(na.strings, "==", d))
is.na(d) <- removena

pdb<-d

pdb<-pdb[complete.cases(pdb[ , 24]),]
head(pdb)
fwrite(pdb,"pdb.cvs")
dim(pdb)

