library(tidyverse)
library(dplyr)
install.packages("data.table")
library(data.table) 
library(ggplot2)
library(dplyr)

dt<-fread("./StzB-3000-54.csv")

na.strings <- c("<NA>","None","none","","NA","Not Specified")

# index matrix 
idx <- Reduce("|", lapply(na.strings, "==", dt))

# replace values with NA
is.na(dt) <- idx

summary_dt<-dt[,.N,by=Phylum]
fwrite(summary_dt,"summary-phylumSTZB1000.csv")
counts_b<-summary_dt[complete.cases(summary_dt)]
p<-ggplot(data=counts_b, aes(x=Phylum, y=N, fill =Phylum))


figx<-p+labs(x="Phylum", y="Counts")+
  geom_bar(stat="identity")+ 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=.4))+
  coord_flip()+
  scale_fill_hue(c=100, l=45)



figx
