setwd('E:\\R语言学习\\第5次作业')
w<-read.table('E:/R语言学习/nam_pheno_part_1.txt',header=T,stringsAsFactors = F)
w
aa<-data.frame(NN=na.omit(w[,2])[1:length(na.omit(w[,2]))])
aa#将第2列中缺失删除，并按删除后的顺序提取
ab<-data.frame(NN=na.omit(w[,2]))
ab#和aa结果一样
w_2<-w[which(w[,2] %in% aa[,1]),]
w_2#如果w的第2列在aa的第一列中，就返回w中对应的值
w_3<-w_2[,-(1:5)]
w_3#提取各个性状值
w_4<-na.omit(w_3)
w_4#删除w_3中存在NA所在行，没有达到只删除某个NA的效果？
cor(w_4)
par(mar=c(4,4,4,4))
#1
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
colnames(matrix_1)<-colnames(w_4)
rownames(matrix_1)<-colnames(w_4)
for(i in 1:ncol(w_4)){
  for (j in 1:ncol(w_4)){
    matrix_1[i,j]<-cor.test(w_4[,i],w_4[,j])$estimate
    matrix_2[i,j]<-cor.test(w_4[,i],w_4[,j])$p.value
  }
}
corrplot::corrplot(matrix_1)
corrplot(matrix_1,method='number',col='black',cl.pos='n')
library(corrplot)
corrplot(matrix_1,method='number',col='black',cl.pos='n')
corrplot::corrplot(matrix_2)
corrplot(matrix_2,method='number',col='black',cl.pos='n')
