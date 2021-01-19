setwd('E:\\R语言学习\\第5次作业')
w<-read.table('E:/R语言学习/nam_pheno_part_1.txt',header=T,stringsAsFactors = F)
w
#删除NAM ID中缺失值
aa<-data.frame(NN=na.omit(w[,2])
aa
w_2<-w[which(w[,2] %in% aa[,1]),]
w_2

w_3<-w_2[,-(1:5)]
w_3
#删除整行的错误示范
w_4<-na.omit(w_3)
w_4
cor(w_4)
par(mar=c(4,4,4,4))

#1正确示范
matrix_1<-matrix(NA,ncol=14,nrow=14)
colnames(matrix_1)<-colnames(w_4)
rownames(matrix_1)<-colnames(w_4)
for(i in 1:ncol(w_4)){
  for (j in 1:ncol(w_4)){
    matrix_1[i,j]<-cor(w_4[,i],w_4[,j])
    tt<-cor.test(w_4[,i],w_4[,j])
  }
}
corrplot::corrplot(matrix_1)
d#2
matrix_1<-matrix(NA,ncol=14,nrow=14)
matrix_2<-matrix(NA,ncol=14,nrow=14)
colnames(matrix_1)<-colnames(w_3)
rownames(matrix_1)<-colnames(w_3)
colnames(matrix_2)<-colnames(w_3)
rownames(matrix_2)<-colnames(w_3)
for(i in 1:ncol(w_3)){
  for (j in 1:ncol(w_3)){
    matrix_1[i,j]<-cor.test(w_3[,i],w_3[,j])$estimate
    matrix_2[i,j]<-cor.test(w_3[,i],w_3[,j])$p.value
  }
}
corrplot::corrplot(matrix_1)
library(corrplot)
corrplot(matrix_1,method='number',col='black',cl.pos='n')
corrplot::corrplot(matrix_2)
corrplot(matrix_2,method='number',col='black',cl.pos='n')
