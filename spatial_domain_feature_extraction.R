# Spatial domain feature extraction function

library(moments)

spatial_domain_features <- function(img){
  
  features <- c(mean(colMeans(img)), mean(rowMeans(img)),
                sd(colMeans(img)), sd(rowMeans(img)),
                skewness(colMeans(img)), skewness(rowMeans(img)),
                kurtosis(colMeans(img)), kurtosis(rowMeans(img)),
                sum(img[1:(round(nrow(img)/2)),])/sum(img[(round(nrow(img)/2)+1):nrow(img),]),
		sum(img[,1:(round(ncol(img)/2))])/sum(img[,(round(ncol(img)/2)+1):ncol(img)]), 
                which.max(colMeans(img)), which.max(rowMeans(img)))

  return(features)
}
