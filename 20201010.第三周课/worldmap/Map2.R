#!/path/to/Rscript
setwd("F:\\20201010.第三周课\\worldmap")
library(maps)
library(plotrix)
P3 <- read.table("input2.txt",header=T)
P3_new=NULL;
for(i in 1:max(P3[,1])){  # 统计各个项的个数。
  P3_1 <- P3[P3[,1]==i,]
  P3_2 <- NULL;
  P3_2[1] = i
  P3_2[2] <- NA
  P3_2[3] <- NA
  P3_2[4] <- mean(P3_1[,4]) # 维度
  P3_2[5] <- mean(P3_1[,5]) # 经度
  P3_2[6] <- nrow(P3_1[P3_1[,3]=="OR-IL",]) # blue
  P3_2[7] <- nrow(P3_1[P3_1[,3]=="OR-JL",]) # red
  P3_2[8] <- nrow(P3_1[P3_1[,3]=="OR-Int",]) # green
  P3_2[9] <- nrow(P3_1[P3_1[,3]=="Or-I",])+nrow(P3_1[P3_1[,3]=="Or-II",])+nrow(P3_1[P3_1[,3]=="Or-III",]) # purple
  P3_new <- rbind(P3_new,P3_2)
}
colnames(P3_new) <- c("num",	"var",	"oringe", "Latitude",	"Longitude",	"OR-IL",	"OR-JL",	"OR-Int",	"Or-I,Or-II,Or-III")
P2 <- P3_new[,-1]

#png("wild446_pie5.png",height = 1000, width = 1600)
pdf("Fig_map_2.pdf",height = 12.8,width = 20)
map("world",xlim=c(70,150),ylim=c(-20,30),fill=T,col="grey95",bg="white",lwd=.1,mar=c(0,0,0,0))
abline(h=0,lwd=2,lty=1,col="gray40")
abline(v=seq(70,150,10),lwd=1,lty=2,col="gray60")  # 经纬线
#abline(v=seq(70,150,1),lwd=0.3,lty=2,col="gray60")
abline(h=seq(-20,20,10),lwd=1,lty=3,col="gray60")
#abline(h=seq(-20,25,1),lwd=0.5,lty=2,col="gray60")
text(70.5, seq(-20,20,10),as.character(seq(-20,20,10)),cex=2)
text(seq(70,140,10),29.5,as.character(seq(70,140,10)),cex=2)

Inum=NULL;Jnum=NULL;Intnum=NULL;Ornum=NULL;Num=NULL;radius=NULL; ## 对每一部分画扇形图。
for(i in 1:nrow(P2)){
  #print(i)
  Inum <- P2[i,5];Jnum <- P2[i,6];Intnum <- P2[i,7];Ornum <- P2[i,8];print(Ornum)
  Num <- Inum + Jnum + Intnum + Ornum # 总数
  radius = 0.6 + Num/30 # 设置半径
  ## rainbow(10,alpha=1) 颜色共有十个：1红，2橙，3黄，4绿，5浅绿，6浅蓝，7蓝，8深蓝，9紫，10粉。
  if(Inum != 0){draw.tilted.sector(P2[i,4],P2[i,3], ## 当个数不为零时执行。
                                   start=0,end=(Inum/Num)*2*pi, ## 设置扇形的开始和终止位置
                                   col=rainbow(10,alpha=.9)[4],border="white",radius=radius,height=0,theta=pi/2,edges=NA)}
  if(Jnum !=0){draw.tilted.sector(P2[i,4],P2[i,3],
                                  start=(Inum/Num)*2*pi,end=(Inum+Jnum)/Num*2*pi,
                                  col=rainbow(10,alpha=.9)[1],border="white",radius=radius,height=0,theta=pi/2,edges=NA)}
  if(Intnum !=0){draw.tilted.sector(P2[i,4],P2[i,3],
                                    start=(Inum+Jnum)/Num*2*pi,end=(Inum+Jnum+Intnum)/Num*2*pi,
                                    col=heat.colors(10, alpha = .7)[6],border="white",radius=radius,height=0,theta=pi/2,edges=NA)}
  if(Ornum !=0){draw.tilted.sector(P2[i,4],P2[i,3],
                                   start=(Inum+Jnum+Intnum)/Num*2*pi ,end=2*pi,
                                   col=gray.colors(1,alpha=.6),border="white",radius=radius,height=0,theta=pi/2,edges=NA)}
}
legend(75,5,bg="white",c("OR-JL","OR-IL","OR-Int","Scattered"),
       col=c(rainbow(10,alpha=.8)[c(1,4)],heat.colors(10, alpha = .7)[6],gray.colors(1,alpha=.6)),pch=19,ncol=1,cex=3,pt.cex=3)
dev.off()
