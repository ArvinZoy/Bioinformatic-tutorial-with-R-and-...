library(maps)
library(mapdata)
library(maptools)
library(ggplot2)
china <- map("china", plot = F)
ggplot() + 
  geom_path(data = china, aes(long, lat, group = group), color = '#C2DBE5', show.legend = F) +
  #geom_point(data = mat.cities, aes(x = long, y = lat, size = population), alpha = 0.8, color = '#8BB6D6') +
  # geom_text_repel(data = mat.cities, aes(x = long, y = lat, label = names), family = "STHeiti") +
  #geom_text(data = mat.cities, aes(x = long, y = lat, label = names), family = "STHeiti") +
  #labs(x = '经度', y = '纬度', title = '中国十二个地区人口地图', size = '人口(百万)') + 
  theme_bw() +
  theme(panel.border = element_blank(),
        text = element_text(family = "STHeiti"),
        plot.title = element_text(hjust = 0.5))

pdf("map_4.pdf", height = 12.8, width = 20)
map("china", col = "red4",mar=c(1,0,0,0), lwd=3, bg = "#F2F6EF")
dev.off()


map<-readShapePoly('bou2_4p.shp')
plot(map)
map("china",
    #fill=T,
    #col="#C2DBE5",
    #bg="red",
    lwd=.1,
    mar=c(0,0,0,0),
    )

setwd("F:\\20201010.第三周课\\worldmap")
library(maps)
library(ggmap)
get_map("china", zoom=4)
pdf("pp_map_2.pdf", height = 12.8, width = 20)
map("world",
    xlim=c(70,138),ylim=c(0,56),
    fill=T,
    col="#C2DBE5",
    bg="white",
    lwd=.1,
    mar=c(0,0,0,0))

abline(h=0,lwd=2,lty=1,col="gray40")
abline(v=seq(70,150,10),lwd=1,lty=2,col="gray60")  # 经纬线
abline(h=seq(-20,20,10),lwd=1,lty=3,col="gray60")
text(70.5, seq(-20,20,10),as.character(seq(-20,20,10)),cex=2)
text(seq(70,140,10),29.5,as.character(seq(70,140,10)),cex=2)

dev.off()

map("world",fill=T,col="skyblue",bg="white",lwd=.1,mar=c(0,0,0,0))
