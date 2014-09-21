#read data
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training$t2 <- as.vector(unlist(read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)))
training$t3 <- as.vector(unlist(read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)))
testing <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing$t2 <- as.vector(unlist(read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)))
testing$t3 <- as.vector(unlist(read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)))
Labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Merge data sets
Datos <- rbind(training, testing)

# Some text cleaning on feature names
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] <- gsub('-mean', 'Mean', features[,2])
features[,2] <- gsub('-std', 'Std', features[,2])
features[,2] <- gsub('[-()]', '', features[,2])

# Filter to get only mean and standard deviation from features and merged data
filtro <- grep(".*Mean.*|.*Std.*", features[,2])
features <- features[filtro,]
filtro <- c(filtro, 562, 563)
Datos <- Datos[,filtro]

# Add the column names (features) to Datos
colnames(Datos) <- c(features$V2, "Activity", "Subject")
colnames(Datos) <- tolower(colnames(Datos))

Activ = 1
for (ActivLabel in Labels$V2) {
  Datos$activity <- gsub(Activ, ActivLabel, Datos$activity)
  Activ <- Activ + 1
}

Datos$activity <- as.factor(Datos$activity)
Datos$subject <- as.factor(Datos$subject)
tidy = aggregate(Datos, by=list(activity = Datos$activity, subject=Datos$subject), mean)

# Remove unneeded columns
tidy<-tidy[,1:88]
write.table(tidy, "tidy.txt", sep="\t", row.name=FALSE)
