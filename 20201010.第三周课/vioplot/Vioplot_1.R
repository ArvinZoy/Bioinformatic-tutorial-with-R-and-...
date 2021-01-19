#20160122 LG3b_GW8======================================
setwd("F:\\20201010.第三周课\\vioplot")
bb <- read.table("vioplot_LG3b_GW8.txt",header=T, na.strings="NA",fill=T)
bb <- na.omit(bb)
TukeyHSD(aov(bb[,3]~bb[,2]))
library(vioplot)
pdf(file="20200404_祝晓阳_vioplot.pdf", width=8, height=10)
par(mar=c(6,7,2,2),mgp=c(4,1,0))
plot(NULL, 
     xaxt="n",cex.axis=2,
     frame.plot=F,
     xaxs="i",xlim=c(0,5),
     yaxs="i",ylim=c(3.8,13),
     xlab="",
     ylab="Grain Length(mm)",cex.lab=3)
vioplot(subset(bb,bb[,2]%in%"TH")[,3], col=rainbow(20)[2], at=1, add=T) # HAP1
vioplot(subset(bb,bb[,2]%in%"CH")[,3], col=rainbow(20)[4], at=2, add=T)
vioplot(subset(bb,bb[,2]%in%"TB")[,3], col=rainbow(20)[6], at=3, add=T)
vioplot(subset(bb,bb[,2]%in%"CB")[,3], col=rainbow(20)[10], at=4, add=T)
axis(1,at=1:4,labels=FALSE,tick=TRUE)
abline(0,0)
text(c(0.8,1.8,2.8,3.8),c(3.2,3.2,3.2,3.2),c("LG3b/GW8","lg3b/GW8","LG3b/gw8","lg3b/gw8"),cex=2.5,xpd=T,srt=20) #xpd 对超出边界的图形的处理方式。！！！！！！
text(1,max(subset(bb,bb[,2]%in%"TH")[,3])+0.4,"a",cex=3)
text(2,max(subset(bb,bb[,2]%in%"CH")[,3])+0.4,"a",cex=3)
text(3,max(subset(bb,bb[,2]%in%"TB")[,3])+0.4,"a",cex=3)
text(4,max(subset(bb,bb[,2]%in%"CB")[,3])+0.4,"b",cex=3)
dev.off()
