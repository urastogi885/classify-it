# Classify-It

## Overview
The project revolves around 2 major tasks: identification of each of the subjects in the given data sets and 
classification of neutral vs facial expression. There are 3 data sets for the project that can be found [here](https://github.com/urastogi885/classify-it/tree/main/Code/Data).
The usage of data sets has a separate readme.

The tasks were performed using 4 classifiers, namely, Bayes, k-Nearest Neighbor (KNN), Kernel SVM, and Boosted SVM classifier. Additionally, principal component analysis (PCA) and multiple discriminant analysis (MDA) had to be employed on the data before feeding it to the classifiers.

## Dependencies
- MATLAB

## Run
- Clone the repo either by downloading the zip version from github or using shell into your MATLAB worspace.
```
cd <your_matlab_workspace>
git clone https://github.com/urastogi885/classify-it
```
- If you downloaded the zip version, extract it.
- Open MATLAB and change path in MATLAB to the _Code_ sub-folder in the project directory.
- To run the project as it is, you can just run the 2 MATLAB live scripts: [task1.mlx](https://github.com/urastogi885/classify-it/blob/main/Code/task1.mlx) and [task2.mlx](https://github.com/urastogi885/classify-it/blob/main/Code/task2.mlx). 
- The scripts have various options for running the classifiers, data analyzers, and on which data set.
- Each of the classifiers and analysis (PCA and MDA) have been implemented as separate functions. Remember to take into consideration the dimensions of your data when using these functions seprately.
