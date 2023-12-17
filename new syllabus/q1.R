# Generate sample data for a healthcare dataset

library(randomForest)
library(caTools)
########## Dataset gets generated from code below #############
# Patient ID
patient_id <- 1:1000

# Age (assumed values between 20 and 70)
age <- sample(20:70, 1000, replace = TRUE)

# Gender (assuming two genders: Male and Female)
gender <- sample(c("Male", "Female"), 1000, replace = TRUE)

# Blood Pressure (assumed values between 90 and 140)
blood_pressure <- sample(90:140, 1000, replace = TRUE)

# Cholesterol Level (assumed values between 150 and 250)
cholesterol <- sample(150:250, 1000, replace = TRUE)

disease <- sample(c("TRUE", "False"), 1000, replace = TRUE)


# Create the healthcare dataset
healthcare_dataset <- data.frame(
  PatientID = patient_id,
  Age = age,
  Gender = gender,
  BloodPressure = blood_pressure,
  Cholesterol = cholesterol,
  Disease = disease
)

healthcare_dataset$Gender <- as.factor(healthcare_dataset$Gender)
healthcare_dataset$Disease <- as.factor(healthcare_dataset$Disease)


# Print the healthcare dataset
print(healthcare_dataset)

# Save the healthcare dataset to a CSV file
csv_file_path <- "healthcare_dataset11.csv"
write.csv(healthcare_dataset, file = csv_file_path, row.names = TRUE)

# Print a message indicating where the file was saved
cat("Healthcare dataset saved to:", csv_file_path, "\n")
########## Dataset gets generated from above below #############


################Now random forest code####################
split<-sample.split(healthcare_dataset,SplitRatio=0.7)

train<- subset(healthcare_dataset,split==TRUE)
test<-subset(healthcare_dataset,split==FALSE)

input<-train[,2:5]
target<-train[,6]

model<-randomForest(input,target,data = train,class.f=TRUE)

pred <- predict(model,test)
pred

cm<-table(pred,test$Disease)
cm

plot(model)
varImpPlot(model)
importance(model)
summary(model)
