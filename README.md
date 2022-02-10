# Classification of clinical text data as drug-resistant TB (DR-TB) or drug-sensitive TB (DS-TB) using a RF model
This directory contains code training and inference using demographic features and radiological features from clinical text data to predict DR-TB vs DS-TB

###Training and validation
RFClassifier_DemographEtRadiol.m , using ten-fold cross validation to train Random Forest (RF) models based on 7 degmographic features and 25 radiological features from 9 folds and validate on one fold. Performances such as AUC, accuracy, specificity, sensitivity, precision, etc are calculated.

Training requires an input CSV file which contains columns including demographic features (such age, gender, education, etc.) and radiological features (such as nodule, cavity, infiltrate, etc.). A CSV file example is put in the directory, named "2622Patients.csv".

Description of arguments above:

**filename1**: (CSV file) Input CSV file with columns including demographic and radiological features

**RFClassifier.mat**: Output random forest model


## Inference

To infer on the files, user has to provide input_filenames.csv (with 'image_file'
 as file path for each Chest-X Ray image) and output_predictions.csv(Output CSV
 File that is saved with 'image_file', 'pred_label','confidence' as columns
 - User can change the name of the  CSV file). In the output_predictions.csv file,
  'pred_label' values are either DR/DS based on the probability('Confidence')
  and the default threshold that we gave(if probability > threshold -> 'DR' else 'DS').
  User can change the threshold by adding argument as --threshold in the command line

```
python dr_ds_inference.py input_filenames.csv output_predictions.csv --threshold 0.5
```
The  files in the weights folder contains 2 weights.
1) trained_on_alldata.h5 : This model was trained on all data.
2) trained_on_alldata_except_belarus.h5 : This model was trained on all data except data  from belarus country.
