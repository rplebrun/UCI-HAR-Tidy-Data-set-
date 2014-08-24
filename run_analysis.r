##Combine Test and Training Sets
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt")
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")
sets<-rbind(xtest,xtrain)

##Combine Test and Training labels
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
activity<-rbind(ytrain,ytest)


##Extract Mean() and Std() Deviation measurements from Sets
##Identify columns for Mean() and Std()
features<-read.table("./UCI HAR Dataset/features.txt")
mean<-grep("-mean()",features[,2],fixed=TRUE)
std<-grep("-std()",features[,2],fixed=TRUE)
measurements<-sort(append(mean,std))

##filter sets for mean and std measurements
sets<-sets[,measurements]

##add measurement names to sets
colnames(sets)<-features[measurements,2]

##add activity names to activity
labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity[,1]<-labels[activity[,1],2]
colnames(activity)<-"activity"

##combine test and training subjects and add column name
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjects<-rbind(subject_test,subject_train)
colnames(subjects)<-"subject"

##Create clean data set
newdata<-cbind(activity,subjects,sets)

##Calculate average by activity by subject using plyr
results<-aggregate(newdata[,c(-1,-2)],list("Activity"=newdata$activity,"Subject"=newdata$subject),mean)

##write new file
write.table(results,"avgsbysubject.txt")







