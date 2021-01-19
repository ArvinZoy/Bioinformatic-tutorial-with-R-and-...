setwd("I:\\LOC_Os01g69910候选基因关联分析")

X<- read.table("69910_manhattan.txt",header = T,sep="\t")
Y<- read.table("69910_significant_snp_manhattan.txt",header = T,sep="\t")

pdf("69910_cmlm_adopted_manhattan.pdf");
par(mfrow=c(4,2.5),mar = c(3.5,4,1.5,2));

plot(X[,1],X[,2],
     pch=20,
     xaxs="i",yaxs="i",
     axes = F,
     col= ("blue"),
     cex=0.8,
     bty="l",
     xlab="",
     ylab="-log10(P observed)",
     ylim=c(0,6),
     tck=-0.03,                   #刻度线的长度
     yaxs="r") #坐标轴y的间隔设定方式
     
box(bty="l",lwd=1.2)
axis(at = c(40395534,40397522,40402909,40403249),labels =c("-1988","1","5388","5728"),tck=-0.03,lwd = 1,side=1,cex.axis = 0.7,mgp=c(4, 0.5, 0));
axis(2,at = c(0,1,2,3,4,5,6,7,8),tck=-0.03,tick =T,las =1,tcl=-0.25,lwd=1,cex.axis =1,mgp=c(4, 0.5, 0))
points(Y[,1],Y[,2],col=("red"),pch=20,cex=0.8)
abline(h=3.43,lwd=1,col="black",lty=5)

dev.off()


#绘制基因结构
pdf("69910_gene.pdf");
par(mfrow=c(4,2.5),mar = c(3.5,4,1.5,2));
plot(X[,1],X[,2],
     pch=20,
     xaxs="i",yaxs="i",
     axes = F,
     col= ("blue"),
     cex=0.8,
     bty="l",
     xlab="",
     ylab="-log10(P observed)",
     ylim=c(-0.5,6),
     tck=-0.03,                   #刻度线的长度
     yaxs="r") #坐标轴y的间隔设定方式

rect(xleft = 40397522, ybottom = -0.3, xright = 40397537, ytop = -0.1,col = "black")
rect(xleft = 40398102, ybottom = -0.3, xright = 40398227, ytop = -0.1,col = "black")
rect(xleft = 40398334, ybottom = -0.3, xright = 40398449, ytop = -0.1,col = "black")
rect(xleft = 40398748, ybottom = -0.3, xright = 40398836, ytop = -0.1,col = "black")
rect(xleft = 40399500, ybottom = -0.3, xright = 40399545, ytop = -0.1,col = "black")
rect(xleft = 40399889, ybottom = -0.3, xright = 40400357, ytop = -0.1,col = "black")
rect(xleft = 40400466, ybottom = -0.3, xright = 40400593, ytop = -0.1,col = "black")
rect(xleft = 40400823, ybottom = -0.3, xright = 40401526, ytop = -0.1,col = "black")
rect(xleft = 40401646, ybottom = -0.3, xright = 40402186, ytop = -0.1,col = "black")
rect(xleft = 40402294, ybottom = -0.3, xright = 40402593, ytop = -0.1,col = "black")
rect(xleft = 40402808, ybottom = -0.3, xright = 40402909, ytop = -0.1,col = "black")

dev.off()
