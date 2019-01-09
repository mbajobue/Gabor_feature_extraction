#!/usr/bin/env python2

import numpy as np
import pandas as pd
from sklearn.metrics import accuracy_score, confusion_matrix
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split


features = pd.read_csv("./extracted_features.csv", header = None)
labels = pd.read_csv("./labels.csv", header = None)

X = features.values
y = labels[0].values

scaler = StandardScaler()
X = scaler.fit_transform(X)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=.2, random_state=9)

clf = SVC(C = 5, gamma = 0.015, kernel = 'rbf')
clf.fit(X_train,y_train)
print(clf)
y_pred = clf.predict(X_test)

print("Accuracy score:")
print(accuracy_score(y_test, y_pred))
print("Confusion matrix:")
print(confusion_matrix(y_test, y_pred))
