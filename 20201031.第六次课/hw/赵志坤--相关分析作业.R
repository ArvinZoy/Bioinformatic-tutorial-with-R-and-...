setwd("C:/Users/Administrator/Desktop/生信学习/第五课")
library(corrplot)
phe=read.table('nam_pheno_part_1.txt',header = T,stringsAsFactors = F)
phe
dim(phe)
na.omit(phe[,2])
aa=data.frame(NN=na.omit(phe[,2])[1:length(na.omit(phe[,2]))])
aa              
phe_2=phe[which(phe[,2] %in% aa[,1]),]              
phe_2
phe_3=phe_2[,-(1:5)]
phe_3
cor(phe_3)
matrix_1<-matrix(NA,ncol=14,nrow=14)
matrix_2<-matrix(NA,ncol=14,nrow=14)
colnames(matrix_1)<-colnames(phe_3)
rownames(matrix_1)<-colnames(phe_3)
colnames(matrix_2)<-colnames(phe_3)
rownames(matrix_2)<-colnames(phe_3)
for(i in 1:ncol(phe_3)){
  for (j in 1:ncol(phe_3)){
    matrix_1[i,j]<-cor.test(phe_3[,i],phe_3[,j])$estimate
    matrix_2[i,j]<-cor.test(phe_3[,i],phe_3[,j])$p.value
  }
}
corrplot::corrplot(matrix_1)
corrplot(matrix_1, method="number",col="black",order = "AOE", type = "upper")

