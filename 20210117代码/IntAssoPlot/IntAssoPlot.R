install.packages(c("ggplot2","ggrepel","reshape2"))
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("SNPRelate","gdsfmt"))
library(remotes) # version 2.1.0
#install_github("whweve/IntAssoPlot")
install_github("whweve/IntAssoPlot",build=TRUE,build_vignettes = TRUE)

library("IntAssoPlot")
example("IntGenicPlot")
example("IntRegionalPlot")

head(association)
#>     Marker Locus     Site         p
#> 1 SNP37049     9 90042244 0.2073684
#> 2 SNP37050     9 90042408 0.5028760
#> 3 SNP37052     9 90210602 0.1561271
#> 4 SNP37053     9 90255652 0.2814653
#> 5 SNP37056     9 90290939 0.6392511
#> 6 SNP44597     9 90367887 0.6582597

head(gtf)
#>   V1             V2          V3       V4       V5 V6 V7 V8
#> 1  9 protein_coding        exon 90030791 90030847  .  -  .
#> 2  9 protein_coding        exon 90030635 90030701  .  -  .
#> 3  9 protein_coding         CDS 90030635 90030681  .  -  0
#> 4  9 protein_coding start_codon 90030679 90030681  .  -  0
#> 5  9 protein_coding        exon 90029368 90029471  .  -  .
#> 6  9 protein_coding         CDS 90029368 90029471  .  -  1
#>                                                                                                             V9
#> 1                gene_id "GRMZM2G416644"; transcript_id "GRMZM2G416644_T01"; exon_number "1"; seqedit "false";
#> 2                gene_id "GRMZM2G416644"; transcript_id "GRMZM2G416644_T01"; exon_number "2"; seqedit "false";
#> 3 gene_id "GRMZM2G416644"; transcript_id "GRMZM2G416644_T01"; exon_number "2"; protein_id "GRMZM2G416644_P01";
#> 4                                 gene_id "GRMZM2G416644"; transcript_id "GRMZM2G416644_T01"; exon_number "2";
#> 5                gene_id "GRMZM2G416644"; transcript_id "GRMZM2G416644_T01"; exon_number "3"; seqedit "false";
#> 6 gene_id "GRMZM2G416644"; transcript_id "GRMZM2G416644_T01"; exon_number "3"; protein_id "GRMZM2G416644_P01";

#only 20 column of the genotype markers are shown.
head(zmvpp1_hapmap[,1:20])
#>          rs allele chrom      pos strand assembly center protLSID assayLSID
#> 1 INDEL-665    -/+     9 94183611      +       NA     NA       NA        NA
#> 2   snp-663    A/T     9 94183597      +       NA     NA       NA        NA
#> 3   snp-649    A/G     9 94183594      +       NA     NA       NA        NA
#> 4   snp-646    C/T     9 94183585      +       NA     NA       NA        NA
#> 5   snp-637    G/T     9 94183584      +       NA     NA       NA        NA
#> 6   snp-636    A/G     9 94183575      +       NA     NA       NA        NA
#>   panel QCcode B73 CIMBL55 CIMBL32 CML298 CML170 CIMBL12 CIMBL95 CIMBL1 CIMBL56
#> 1    NA     NA  --      ++      ++     ++     ++      ++      ++     --      --
#> 2    NA     NA  AA      TT      TT     TT     TT      TT      TT     NN      NN
#> 3    NA     NA  AA      GG      GG     GG     GG      GG      GG     NN      NN
#> 4    NA     NA  CC      TT      TT     TT     TT      TT      TT     NN      NN
#> 5    NA     NA  GG      TT      TT     TT     TT      TT      TT     NN      NN
#> 6    NA     NA  AA      AA      AA     AA     AA      AA      AA     NN      NN

IntRegionalPlot(chr=9,left=94178074-200000,right=94178074+200000,gtf=gtf,association=association,hapmap=hapmap_am368,hapmap_ld=hapmap_am368,threshold=5,leadsnp_size=2)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276


IntRegionalPlot(chr=9,left=94178074-200000,right=94178074+200000,gtf=gtf,association=association,hapmap=hapmap_am368,hapmap_ld=hapmap_am368,threshold=5,leadsnp_size=2,colour02 = "gray1",colour04 = "gray21",colour06 = "gray41",colour08 = "gray61",colour10 = "gray81")
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276


#get five colors ranging from white to red
pal <- colorRampPalette(c("white", "red"))
IntRegionalPlot(chr=9,left=94178074-200000,right=94178074+200000,gtf=gtf,association=association,hapmap=hapmap_am368,hapmap_ld=hapmap_am368,threshold=5,leadsnp_size=2,colour02 = pal(5)[1],colour04 = pal(5)[2],colour06 = pal(5)[3],colour08 = pal(5)[4],colour10 = pal(5)[5])
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276


#get five colors ranging from white to red
pal <- colorRampPalette(c("white", "red"))
IntRegionalPlot(chr=9,left=94178074-200000,right=94178074+200000,gtf=gtf,association=association,hapmap=hapmap_am368,hapmap_ld=hapmap_am368,threshold=5,leadsnp_size=2,colour02 = pal(5)[1],colour04 = pal(5)[2],colour06 = pal(5)[3],colour08 = pal(5)[4],colour10 = pal(5)[5],label_gene_name = TRUE)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 270
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 143276

IntRegionalPlot(chr=9,left=94178074-100000,right=94178074+100000,gtf=gtf,association=association,hapmap=hapmap_am368,hapmap_ld=hapmap2,threshold=5,leadsnp_size=2)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 108
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 56746
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 104
#>     # of SNPs: 1,081
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 114672

IntRegionalPlot(chr=9,left=94178074-2000,right=94178074+5000,gtf=gtf,association=association,hapmap=hapmap_am368,hapmap_ld=hapmap_am368,threshold=5,leadsnp_size=2)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 41
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 21412
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 368
#>     # of SNPs: 41
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 21412

IntGenicPlot('GRMZM2G170927_T01',gtf,association=zmvpp1_association,hapmap=zmvpp1_hapmap,hapmap_ld = zmvpp1_hapmap,threshold=8,leadsnpLD = FALSE)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 53
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 9992
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 53
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 9992

IntGenicPlot('GRMZM2G170927_T01',gtf,association=zmvpp1_association,hapmap=zmvpp1_hapmap,hapmap_ld = zmvpp1_hapmap,threshold=8,up=500,down=600,leadsnpLD = FALSE)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488

IntGenicPlot('GRMZM2G170927_T01',gtf,association=zmvpp1_association,hapmap=zmvpp1_hapmap,hapmap_ld = zmvpp1_hapmap,threshold=8,up=500,down=600,leadsnpLD = FALSE,marker2highlight=marker2highlight)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488

IntGenicPlot('GRMZM2G170927_T01',gtf,association=zmvpp1_association,hapmap=zmvpp1_hapmap,hapmap_ld = zmvpp1_hapmap,threshold=8,up=500,down=600,leadsnpLD = FALSE,marker2highlight=marker2highlight,link2gene=marker2link,link2LD=marker2link)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488

IntGenicPlot('GRMZM2G170927_T01',gtf,association=zmvpp1_association,hapmap=zmvpp1_hapmap,hapmap_ld = zmvpp1_hapmap,threshold=8,up=500,down=600,leadsnpLD = FALSE,marker2highlight=marker2highlight,link2gene=marker2link,link2LD=marker2link,marker2label=marker2link,marker2label_angle=60,marker2label_size=2)
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488
#> Linkage Disequilibrium (LD) estimation on genotypes:
#>     # of samples: 141
#>     # of SNPs: 124
#>     using 1 thread
#>     method: correlation
#> LD matrix:    the sum of all selected genotypes (0,1,2) = 23488
