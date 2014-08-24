Variables & data:

xtest is x_test.txt
xtrain is x_train.txt
sets is the combination of xtest and xtrain

ytest is y_test.txt
ytrain is y_train.txt
activity is the combination of ytest and ytrain

subject_test is subject_test.txt
subject_train is subject_train.txt
subjects is the combination of the subjects for all results

features is the features.txt
labels is the activity_labels.txt

Transformations:

measurements is the use of grep function to extract festures containing mean() and std() from features
used measurements to subset sets and add variable names

used labels to add activity names to the activity

combined activity, subjects, and sets using cbind

use aggregate method to group measurementdata based on activity and subject,
then calculate each group's mean using mean function
