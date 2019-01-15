# Gabor feature extraction for handwritten character recognition

- `gabor_feature_extraction.R`: an R function that extracts 72 features from an input image using Gabor filters (detailed explanation below).

- `spatial_domain_feature_extraction.R`:  an R function that extracts 12 simple features from the spatial domain of the input image.

- `MNIST_example/feature_extraction.R`:  feature extraction example for a reduced MNIST dataset (4000 samples).

- `MNIST_example/svm_classification.py`: SVM classification example using extracted features. 


## Feature extraction

### Gabor features

The input image is filtered with a set of 18  Gabor filters. Gabor filters are generated using 3 different wavelengths and 6 different orientations. 18 filtered images are obtained for each sample. The standard deviation, mean, kurtosis and skewness of the filtered images are computed. This forms a vector of 72 features for each sample image.

Input image should consist of the matrix corresponding to a single-channel digital image where each pixel is represented by a whole number ranging from 0 to 225.


### Spatial domain features

Other simple features are extracted from the spatial domain of the sample images.


## Results

Features are classified using support vector machines (SVM). These results are comparable to those obtained by using convolutional neural networks (CNN).

|Dataset|Accuracy|
|---|---|
|MNIST|98%|
|Reduced MNIST (4000 samples)|95%|
