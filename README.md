# Classify-It

## Overview
The project revolves around 2 major tasks: identification of each of the subjects in the given data sets and 
classification of neutral vs facial expression. There are 3 data sets for the project that can be found [here](https://github.com/urastogi885/classify-it/tree/main/Code/Data).
The usage of data sets has a separate readme.

The tasks were performed using 4 classifiers, namely, Bayes, k-Nearest Neighbor (KNN), Kernel SVM, and Boosted SVM classifier. Additionally, principal component analysis (PCA) and multiple discriminant analysis (MDA) had to be employed on the data before feeding it to the classifiers.

## Dependencies
- MATLAB

## Pipeline
- First, we perform preprocessing on the required data set where it is reshaped to shift all the feature data into a single column. Note that this is not done for Illumination.mat data set. The data set is also split into training and testing data sets.
- Labels for training and testing data sets are generated as well during preprocessing.
- We preform the user selected analysis on the training data such as PCA and MDA. The user can select to perform no analysis as well.
- Training data is fed to the user selected classifier for learning.
- Finally, accuracy of the classifier is measured by employing the classifier on the testing data.

## Results
Task 1: Identification of each of the subjects in the given data sets
- The Illumination.mat and Pose.mat data sets have 2 testing samples per subject. In the Data.mat data set, 1 testing sample has been taken for each subject. The rest of the samples are used for training.
- For this task, the change in the accuracy of the Bayes and kNN classifiers was studied when PCA, MDA, or no analysis is applied to the training data before feeding it to the classifiers. Figure 1 shows the accuracy of all the classifiers on various data sets under varying analysis methods such as PCA and MDA. Note that I have taken 3 nearest neighbors for my analysis of the kNN classifier.

<p align="center">
  <img src="https://github.com/urastogi885/classify-it/blob/main/graphs/task1.png">
  <br><b>Figure 1 - Accuracy of the Bayes and kNN classifier under various analysis methods</b><br>
</p>

Task 2: Classification of neutral vs facial expression
- Here, Data.mat was used as the data set. A split ratio of 0.25:0.75 (testtotrain) was kept. Each run sources random samples for the training and testing data sets while maintaining the split ratio.
- A total of 4 experiments were done in this task:
  - Test the impact of samples included for training
  - Test the impact of number of nearest neighbors for kNN
  - Test the impact of r and σ in Kernel SVM
  - Test the performance of the Boosted SVM classifier
- The results of the above experiments can be found in the [report](https://github.com/urastogi885/classify-it/blob/main/report.pdf).

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
