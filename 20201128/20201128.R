setwd("F:\\20201128")
y <- read.table("2017HN_NAM_phenotype_for_GAPIT.txt", header = T)
rela <- read.table("Relation_NAM_Parent.txt", header = T)
my <- c("Ba","Ad","Ae","Ah","Ai","Am","Ao","Ap","Aq","Ar","As","At","Ax","Bb","Ca","Bg","Bh","Bk","Br","Bt","Bv","Bw","Bp")

myrela <- rela[rela[,4] %in% my,]
myy <- y[y[,1]%in%myrela[,1],]
write.table(myy, "myy.3.txt", col.names = T, row.names = F, quote = F, sep = "\t")

g <- read.table("20201115_NAM_SNP_all_hmp_2.txt.miss.7.maf.05.HMP.withhead", header = T)
g11 <- g[,1:11]
index <- which(colnames(g) %in% (myy[,1]))
myg1 <- g[,index]
myg2 <- cbind(g11,myg1)
write.table(myg2,"myg.3.txt", col.names = T, row.names = F, quote = F, sep = "\t")
