#!/path/to/Rscript
library('MASS') # required for ginv
library(multtest)
library(gplots)
library(compiler) #required for cmpfun
library("scatterplot3d")
library("bigmemory")
source("/home/test2/GAPIT_emmaFunc/function20170224.txt",local =TRUE)
source("/home/test2/GAPIT_emmaFunc/emma20170224.txt",local =TRUE)
#====================================
setwd("")
myY <- read.table("", head = TRUE)
myG <- read.table("", head = F)

myGAPIT <- GAPIT(
  Y=myY2,
  G=myG,
  group.from=0,
  group.to=0
)
