# Gabor feature extraction function

gabor_feature_extraction <- function(img){
  
  gabor_mean_features <- numeric()
  gabor_sd_features <- numeric()
  gabor_skewness_features <- numeric()
  gabor_kurtosis_features <- numeric()
  
  # Normalize vectors function
  scalar1 <- function(x) {x / sqrt(sum(x^2))}
  
  
  for (j in seq(0,150,30)){
    for (k in c(3,13,23)){
      
      gf_img <- gabor.filter(img, theta = j, lamda = k)
      
      gabor_mean_features <- c(gabor_mean_features, mean(gf_img$filtered_img))
      gabor_sd_features <- c(gabor_sd_features, sd(gf_img$filtered_img))
      gabor_skewness_features <- c(gabor_skewness_features,
				   skewness(as.vector(gf_img$filtered_img)))
      gabor_kurtosis_features <- c(gabor_kurtosis_features,
				   kurtosis(as.vector(gf_img$filtered_img)))
      
    }
  }
  
  features <- c(scalar1(gabor_mean_features), scalar1(gabor_sd_features),
	       	scalar1(gabor_skewness_features), scalar1(gabor_kurtosis_features))
  
  return(features)
}
