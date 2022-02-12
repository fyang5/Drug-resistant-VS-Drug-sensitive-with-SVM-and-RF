# Classification of clinical text data as drug-resistant TB (DR-TB) or drug-sensitive TB (DS-TB) using a RF model
This directory contains code training and inference using demographic features and radiological features from clinical text data to predict DR-TB vs DS-TB

## Training and validation
RFClassifier_DemographEtRadiol.m , using ten-fold cross validation to train Random Forest (RF) models based on 7 degmographic features and 25 radiological features from 9 folds and validate on one fold. Performances such as AUC, accuracy, specificity, sensitivity, precision, etc are calculated.

RFClassifier_DemographEtRadiol.m requires an input CSV file which contains columns including demographic features (such age, gender, education, etc.) and radiological features (such as nodule, cavity, infiltrate, etc.). A CSV file example is put in the directory, named "2622Patients.csv". Users can change this csv file name in line 8.

Description of arguments above:
**filename1**: (CSV file) Input CSV file with columns including demographic and radiological features
**RFClassifier.mat**: Output random forest model

## Inference

To infer on the files, user has to provide input_filenames.csv (with demographic feature columns or/and radiological feature columns).
 - Users should provide a test.csv file, in which features in columns 5-15 and 40-65 are the same as 2622Patients.csv file.

```
run test_DRvsDS.m
```
