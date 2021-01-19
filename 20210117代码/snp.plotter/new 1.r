####################################################################
#                    snp.plotter
###################################################################
#install.packages("snp.plotter",dependencies=TRUE)
library("snp.plotter")
#snp.plotter(config.file = "config_ARID.txt")
setwd("F:\\20210117\\20210117代码\\snp.plotter")
snp.plotter(
  SNP.FILE="P-value.txt", # 
  #PALETTE.FILE="palette.txt", # 
  EVEN.SPACED=FALSE,
  USE.GBL.PVAL=FALSE,
  DISP.HAP=FALSE,
  DISP.LDMAP=TRUE,
  LD.COLOR.SCHEME="heat",
  COLOR.LIST="blue",
  SYMBOLS="circle-fill",
  PVAL.THRESHOLD=1,
  LAB.Y=c("log"),
  GENOTYPE.FILE="myG.ped.txt", # 
  LD.TYPE="rsquare",
  DISP.COLOR.BAR=TRUE,
  DISP.TYPE="symbol",
  DISP.LEGEND=TRUE,
  SAMPLE.LABELS="",##
  IMAGE.TYPE=c("pdf"),
  DISP.SNP=TRUE,
  DISP.MULT.LAB.X=FALSE,
  IMAGE.TITLE=" ", # 
  IMAGE.NAME="", # 
  IMAGE.SIZE=3.5,
  CONNECTING.LINES.FACTOR=1.5,
  DISP.PHYS.DIST=TRUE,
  CONNECTING.LINES.ADJ=0.02,
  FONT.FACTOR=0.2
)
