install.packages("psych")
library(psych)

setwd("C:\\Users\\DELL\\Desktop\\working files\\Project files\\Analytics Model developement\\LSTM")

Rawdata<- read.csv("Rawdata.csv")
data<-Rawdata[,c("MatureAreaHabyMonthly","FFBProductionYieldperHectareTonnesHectare","CPOProductionTONNES",
                 "CrudePalmOilExportCPO")]
# str((data))

corrm<- cor(data) 
require(psych)
require(GPArotation)
scree(corrm, factors=T, pc=T, main="scree plot", hline=NULL, add=FALSE)
eigen(corrm)$values                                                     
require(dplyr)


# Pricipal Components Analysis
# entering raw data and extracting PCs
# from the correlation matrix
fit <- princomp(data, cor=TRUE)
summary(fit) # print variance accounted for
loadings(fit) # pc loadings
plot(fit,type="lines") # scree plot
fit$scores # the principal components
biplot(fit)
