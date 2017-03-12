rm(list=ls())
dir="F:/Tesis_2/PRE-PROCESAMIENTO/Data Hidro-Meteo/data satelital/base de dato HYDRACCESS"
setwd(dir)
files=Sys.glob("*.csv")
files

for(j in 1){
data=read.csv(files[j])
data=data[,2:ncol(data)]
data=data[ , order(names(data))]
list=list()
for(i in 1:ncol(data)){
  x=data[,i]
  list[[i]]=t(t(x))
}
list.f=do.call(rbind,list)
fecha=rep(seq.Date(from=as.Date("2000/09/01"),to=as.Date("2015/12/31"),by="day"),11)
data.export=data.frame(Id_Station=rep(1:11,c(rep(nrow(data),11))),Capteur=rep("Jpd",nrow(data)),Date=fecha,Valeur=list.f,Origine=rep("L",nrow(data)))
write.table(data.export,file=paste(substr(files[j],1,nchar(files[j])-4),".txt"),sep = "\t",row.names = F,na="",quote = F)
}

