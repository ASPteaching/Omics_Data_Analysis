#---------------------------------------------------------------------------------------------
###INSTALLATION OF PACKAGES NEEDED
#---------------------------------------------------------------------------------------------

installifnot <- function (pkg){
  if (!require(pkg, character.only=T)){
  source("http://bioconductor.org/biocLite.R")
  biocLite(pkg)
}else{
  require(pkg, character.only=T)
  }
}
installifnot("GEOquery")

#---------------------------------------------------------------------------------------------
###LOAD DATA: TARGETS AND CEL FILES. 
#---------------------------------------------------------------------------------------------

fileList<- dir()
datDirs <- grep("dataset", fileList)
dataDirs <- fileList[datDirs]
GEOSETS <- c("GSE18198", "GSE1561", "GSE100924", "GSE68580")

# Get data from the web
require(GEOquery)

###########################################
### Dataset 1 (GSE18198)
###########################################

i <- 1
rawData <- getGEO(GEOSETS[i])
class(rawData); names(rawData); class(rawData[[1]])
eset <-rawData[[1]]
pData(eset)

#TARGETS
colnames(pData(eset))
targets <-pData(eset)[,c("title", "cell line:ch1")] 
targets

# Expression Matrix
expresMat <- exprs(eset)
colnames(expresMat) <- targets$title

dir2Save <- paste(dataDirs[i], GEOSETS[i], sep="/")

write.csv(targets,file=paste(dir2Save, "txt", sep=".") )
save(eset, expresMat, targets, file=paste(dir2Save, "Rda", sep="."))

###########################################
### Dataset 2 (GSE1561)
###########################################

i <- 2
rawData <- getGEO(GEOSETS[i])
class(rawData); names(rawData); class(rawData[[1]])
eset <-rawData[[1]]
head(pData(eset))

#TARGETS
colnames(pData(eset))
targets <-pData(eset)[,c("title","type")] 
targets

# Expression Matrix
expresMat <- exprs(eset)
colnames(expresMat) <- targets$title

dir2Save <- paste(dataDirs[i], GEOSETS[i], sep="/")

write.csv(targets,file=paste(dir2Save, "txt", sep=".") )
save(eset, expresMat, targets, file=paste(dir2Save, "Rda", sep="."))

###########################################
### Dataset 4 (GSE100924)
###########################################

i <- 3
rawData <- getGEO(GEOSETS[i])
class(rawData); names(rawData); class(rawData[[1]])
eset <-rawData[[1]]
dim(exprs(eset))

#TARGETS
colnames(pData(eset))
head(pData(eset))
targets <-pData(eset)[,c("cold exposure:ch1",  "genotype:ch1")] 
targets

# Expression Matrix
expresMat <- exprs(eset)
# colnames(expresMat) <- targets$title

dir2Save <- paste(dataDirs[i], GEOSETS[i], sep="/")

write.csv(targets,file=paste(dir2Save, "txt", sep=".") )
save(eset, expresMat, targets, file=paste(dir2Save, "Rda", sep="."))

###########################################
### Dataset 5 (GSE68580)
###########################################

i <- 4
rawData <- getGEO(GEOSETS[i])
class(rawData); names(rawData); class(rawData[[1]])
eset <-rawData[[1]]
dim(exprs(eset))

#TARGETS
colnames(pData(eset))
head(pData(eset))
targets <-pData(eset)[,c("title","geo_accession")] 
targets

# Expression Matrix
expresMat <- exprs(eset)
# colnames(expresMat) <- targets$title

dir2Save <- paste(dataDirs[i], GEOSETS[i], sep="/")

write.csv(targets,file=paste(dir2Save, "txt", sep=".") )
save(eset, expresMat, targets, file=paste(dir2Save, "Rda", sep="."))





