setwd("")
#基因型文件位置：/home/test2/tasseladmin-tassel-5-standalone/TASSELTutorialData/data/mdp_genotype.hmp.txt
# 要求：第20个到40个SNP做LD图
cat *hmp.txt | head -n 41 | tail -n 20 > 1.txt
cat *hmp.txt | head -n 1 > 2.txt
cat 2.txt 1.txt > 3.txt


myLDplot=function(file,LD=F,out=F){
  library("genetics")
  library("LDheatmap")
  data=read.table(file,head=T,com="",sep="\t",row=1,na.string="--")
  gene=data[,11:ncol(data)]
  gene=data.frame(t(gene))
  gty=makeGenotypes(gene,sep="")

  rgb.palette <- colorRampPalette(rev(c("yellow","white" ,"red")), space = "rgb")
  png(file="3.png",res=300,width=2000,height=2000)
  myld=LDheatmap(gty,genetic.distances=data$pos,flip=T,add.map=T,color=rgb.palette(18),pop=T)
  dev.off()
  if(LD){
  write.table(myld$LDmatrix,file=sub(".txt","_LD.txt",file),sep="\t",quote=F)
  }
  if(out){ myld}else{NULL}
}
#example
myLDplot("myfile.txt", LD=T, out=T)

library(LDheatmap)
#GY - permission check
#Load the package's data set
data(CEUData)
#Creates a data frame "CEUSNP" of genotype data and a vector "CEUDist"
#of physical locations of the SNPs

#### Produce a heat map in a grey color scheme ####
LDheatmap(gdat = CEUSNP, genetic.distances = CEUDist)


MyHeatmap <- LDheatmap(gdat = CEUSNP, genetic.distances = CEUDist,
                       color = grey.colors(20))

# Prompt the user before starting a new page of graphics output
# and save the original prompt settings in old.prompt.
old.prompt <- devAskNewPage(ask = TRUE)

# Highlight a certain LD block of interest:
LDheatmap.highlight(MyHeatmap, i = 3, j = 8, col = "red", fill = NA, lwd = 5)

# Plot a symbol in the center of the pixel which represents LD between
# the fourth and seventh SNPs:
LDheatmap.marks(MyHeatmap,  4,  7,  pch = "*")
LDheatmap.marks(MyHeatmap,  4,  7,  pch = "*", col = "red", cex = 5)

LDheatmap(MyHeatmap, SNP.name = c("rs2283092", "rs6979287"), newpage=FALSE,
          color="blueToRed")
##Draw and the first heat map on the left half of the graphics device
LD1<-LDheatmap(MyHeatmap, color=grey.colors(20), newpage=FALSE,
               title="Pairwise LD in grey.colors(20)",
               SNP.name="rs6979572", geneMapLabelX=0.6,
               geneMapLabelY=0.4, name="ld1")

##Draw the second heat map on the right half of the graphics device
LD2<-LDheatmap(MyHeatmap, newpage=FALSE, title="Pairwise LD in heat.colors(20)",
               SNP.name="rs6979572", geneMapLabelX=0.6, geneMapLabelY=0.4, name="ld2")
