### R code from vignette source 'caso2-PCA_y_efecto_batch.rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: basicOptions
###################################################
options(width=80, warn=0, digits=4)


###################################################
### code chunk number 2: leeDatos
###################################################
data <-read.table(file.path("data", "Breast_Cancer.txt"), head=T, sep="\t", as.is=TRUE)
# Fora els controls
data <- data[-(1:2),]
targets <- data[,1:5]
#treure el simbol "+"
targets[targets=="E2+ICI"]<- "E2.ICI"
targets[targets=="E2+Ral"]<- "E2.Ral"
targets[targets=="E2+TOT"]<- "E2.TOT"
sampleNames <- targets$ShortName <- paste(targets$Treatment,targets$Time,targets$Batch, sep=".")
targets <-targets[,-5]
x <- t(data[,-(1:5)])
colnames(x) <-sampleNames
head(x)
save(x, targets, file=file.path("data","dades.Rda"))


###################################################
### code chunk number 3: texTablaNN
###################################################
stopifnot(require(xtable))
x.big <- xtable(targets,
                label = 'targetsTable',
                caption = 'Tabla de grupos y covariables presentes en el estudio analizado')
print(x.big, type="latex")


###################################################
### code chunk number 4: preajustes
###################################################
colores <- c(rep("yellow", 4), rep("blue", 4), rep("red", 4), rep("green", 4))


###################################################
### code chunk number 5: boxplot
###################################################
boxplot(as.data.frame(x), cex.axis=0.6, col=colores, las=2, names=sampleNames, 
        main="Signal distribution for selected chips")


###################################################
### code chunk number 6: plotPC
###################################################
plotPCA <- function ( X, labels=NULL, colors=NULL, dataDesc="", scale=FALSE)
{
  pcX<-prcomp(t(X), scale=scale) # o prcomp(t(X))
  loads<- round(pcX$sdev^2/sum(pcX$sdev^2)*100,1)
  xlab<-c(paste("PC1",loads[1],"%"))
  ylab<-c(paste("PC2",loads[2],"%"))
  if (is.null(colors)) colors=1
  plot(pcX$x[,1:2],xlab=xlab,ylab=ylab, col=colors, 
       xlim=c(min(pcX$x[,1])-10, max(pcX$x[,1])+10))
  text(pcX$x[,1],pcX$x[,2], labels, pos=3, cex=0.8)
  title(paste("Plot of first 2 PCs for expressions in", dataDesc, sep=" "), cex=0.8)
}


###################################################
### code chunk number 7: plotPCA2D
###################################################
plotPCA(x, labels=sampleNames, dataDesc="selected samples")


###################################################
### code chunk number 8: plotPCA3D
###################################################
if(!(require(scatterplot3d))) install.packages("scatterplot3d")
require(scatterplot3d)
label<- sampleNames
pcX<-prcomp(t(x), scale=FALSE) # o prcomp(t(X))
res3d<-scatterplot3d(pcX$x[,1:3], angle=20)
text(res3d$xyz.convert(pcX$x[,1], pcX$x[,2], pcX$x[,3]), 
     labels=sampleNames, pos=3, cex=0.6)
title(paste("Plot of first 3 PCs for expressions"), cex=0.8)


###################################################
### code chunk number 9: distAnalisis
###################################################
manDist <- dist(t(x))
heatmap (as.matrix(manDist), col=heat.colors(16))


###################################################
### code chunk number 10: mds
###################################################
require(MASS)
sam1<-sammon (manDist, trace=FALSE)
plot(sam1$points)
text(sam1$points, targets$Batch, pos=4)


###################################################
### code chunk number 11: pesDelsBlocs
###################################################
# Prova
x1<-x[1,]
treat <- as.factor(targets$Treatment)
time <-  as.factor(targets$Time)
batch <-  as.factor(targets$Batch)
mimod <- x1 ~treat+time+batch
aov1<-aov(mimod)
s<-summary(aov1)
Fs<- s[[1]][,3]/s[[1]][4,3]

myLM <- function(x){
  mimod <- x ~ treat+time+batch
  s<-summary(aov(mimod))
  return(s[[1]][,3]/s[[1]][4,3])
  }

Fs<- apply(x,1,myLM)
M <-apply(Fs,1,  mean, na.rm=T)
names(M) <- rownames(Fs)<- c("Treatment", "Time", "Batch", "Error")


###################################################
### code chunk number 12: varSources
###################################################
barplot(M, col=c("green", "blue", "yellow", "red"), axis.lty=1,
        main="Sources of variation.\n")


###################################################
### code chunk number 13: maxBatch
###################################################
highF <- quantile(Fs["Batch",],0.9, na.rm=TRUE)
lowF <-  quantile(Fs["Batch",],0.1, na.rm=TRUE)
hFs<- which(Fs[,3] >= highF)[1]
Fs[,3]
summary(aov(x[3,] ~treat+time+batch))


###################################################
### code chunk number 14: removBatch1
###################################################
  meanA <- mean(x[3,batch=="A"])
  meanB <- mean(x[3,batch=="B"])
  xAdj <-  ifelse(batch=="A", x[3,]-meanA, x[3,]-meanB)
  mimodAdj <- xAdj ~treat+time+batch
  aovAdj<-aov(mimodAdj)
  summary(aovAdj)


###################################################
### code chunk number 15: removeBatchAll
###################################################
bcX <- cbind(t(scale(t(x[,batch=="A"]), center=TRUE, scale=FALSE)),
             t(scale(t(x[,batch=="B"]), center=TRUE, scale=FALSE)))
bcX <-bcX[, colnames(x)]
# colnames(x)== colnames(bcX)


###################################################
### code chunk number 16: verificaNoBatch
###################################################
adjFs<- apply(bcX,1,myLM)
adjM <-apply(adjFs,1,  mean, na.rm=T)
names(adjM) <- rownames(adjFs)<- c("Treatment", "Time", "Batch", "Error")


###################################################
### code chunk number 17: varSourcesAdjusted
###################################################
barplot(adjM, col=c("green", "blue", "yellow", "red"), axis.lty=1,
        main="Sources of variation.\nBatch-adjusted data")


###################################################
### code chunk number 18: plotPCA2DAdjusted
###################################################
label<- sampleNames
plotPCA(bcX, labels=label, dataDesc="Batch-adjusted data")


