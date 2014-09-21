Variables used in run_analysis.R
--------------------------------
training: used to store the contents of files X_train.txt, Y_train.txt and subject_train.txt
testing: used to store the contents of files X_test.txt, Y_test.txt and subject_test.txt 
Labels: used to store the content of file activity_labels.txt, containing descriptive names for user actions.
Datos: training + testing dataset.
features: used to store the contents of features.txt, containing descriptive names of sensor data.
filtro: used to store the position of descriptive names (from features.txt) that contains "Mean" and "Std"
Activ: counter in the For loop
ActivLabel: temporary variable in the For loop
tidy: used to store tidy data for step 5

Data used in run_analysis.R
---------------------------
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample

Data transformations performed in run_analysis.R
------------------------------------------------
-data for the training and testing set are loaded into 2 different variables (training and testing).
-data for activity labels are loaded in "Labels" variable.
-training and testing data is merged on a single variable: "Datos" 
-descriptive names for features are loaded on a variable named "features"
-feature names are "cleaned" to eliminate "-", "(" and ")" characters. "-mean" and "-std" are transformed to "Mean" and "Std"
-a filter proccess is performed to get only mean and standard deviation from features and merged data.
-column names (features) are added to merged data ("Datos").
-"activity" and "subject" columns are converted into factors for easy summarizing
-data is summarized with "aggregate" command.
-the table with the final tidy data is written to disk ("tidy.txt")
