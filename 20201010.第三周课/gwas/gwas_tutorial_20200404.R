install.packages("BiocManager")
BiocManager::install(c("multtest","snpStats"))
# install packages==================================================
if(!'multtest'%in% installed.packages()[,"Package"]){
  source("http://www.bioconductor.org/biocLite.R")
  biocLite("multtest")
  biocLite("snpStats")
}
if(!require(gplots)) install.packages("gplots")
if(!require(LDheatmap)) install.packages("LDheatmap")
if(!require(genetics)) install.packages("genetics")
if(!require(ape)) install.packages("ape")
if(!require(compiler)) install.packages("compiler")

if(!require(EMMREML)) install.packages("EMMREML")
if(!require(scatterplot3d)) install.packages("scatterplot3d")
# ==================================================================
# start
# library packages
library("multtest");library("snpStats");library("gplots");library("LDheatmap");library("genetics");library("ape");library("compiler");library("EMMREML");library("scatterplot3d")
# source function
source("F:\\20201010.第三周课\\gwas\\gapit3_function_20200404.txt",local=TRUE)
# set work directory
setwd("F:\\20201010.第三周课\\gwas")

# read data
myY <- read.table("mdp_traits.txt", head=TRUE)
myG <- read.table("mdp_genotype_test.hmp.txt", head=FALSE)

# GLM 
myGAPIT_GLM <- GAPIT(
  Y=myY[,c(1,2)],
  G=myG,
  model="GLM",
  PCA.total=5,
  file.output=T
)

# CMLM
myGAPIT_GLM <- GAPIT(
  Y=myY[,c(1,2)],
  G=myG,
  model="CMLM",
  PCA.total=5,
  file.output=T
)

# read G data as numeric 
myGD <- read.table("mdp_numeric.txt", head=TRUE)
myGM <- read.table("mdp_SNP_information.txt", head=TRUE)
# GLM
myGAPIT_GLM <- GAPIT(
  Y=myY[,c(1,2)],
  GD=myGD,
  GM=myGM,
  model="GLM",
  PCA.total=5,
  file.output=T
)


