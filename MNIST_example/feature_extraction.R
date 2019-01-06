#!/usr/bin/env Rscript

library(wvtool)
library(moments)

train_samples <- read.csv("./reduced_MNIST.csv")

# Import image
import <- function(i){

  matrix(unlist(train_samples[i,])[2:785], nrow = 28,byrow = T)

}

# Gabor feature extraction function
source(file = "../gabor_feature_extraction.R")
source(file = "../spatial_domain_feature_extraction.R")


# Labels vector
label <- train_samples[[1]]


# Feature extraction of the firt sample and creation of the features dataframe
img <- import(1)
first_sample_features <- c(gabor_feature_extraction(img),
			   spatial_domain_features(img))

features <- data.frame(matrix(first_sample_features, byrow = T,
				    ncol = length(first_sample_features)))


# Feature extraction

for (i in seq(2, nrow(train_samples))) {
  
  img <- import(i)
  features <- rbind(features, c(gabor_feature_extraction(img),
			     spatial_domain_features(img)))

}


write.table(features, file = "extracted_features.csv", row.names=FALSE,
	    col.names=FALSE, sep=",")
write.table(label, file = "labels.csv", row.names=FALSE,
	    col.names=FALSE, sep=",")
