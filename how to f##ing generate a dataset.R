# Generate sample data for a healthcare dataset

# Patient ID
patient_id <- 1:20

# Age (assumed values between 20 and 70)
age <- sample(20:70, 20, replace = TRUE)

# Gender (assuming two genders: Male and Female)
gender <- sample(c("Male", "Female"), 20, replace = TRUE)

# Blood Pressure (assumed values between 90 and 140)
blood_pressure <- sample(90:140, 20, replace = TRUE)

# Cholesterol Level (assumed values between 150 and 250)
cholesterol <- sample(150:250, 20, replace = TRUE)

# Create the healthcare dataset
healthcare_dataset <- data.frame(
  PatientID = patient_id,
  Age = age,
  Gender = gender,
  BloodPressure = blood_pressure,
  Cholesterol = cholesterol
)

# Print the healthcare dataset
print(healthcare_dataset)

# Save the healthcare dataset to a CSV file
csv_file_path <- "healthcare_dataset.csv"
write.csv(healthcare_dataset, file = csv_file_path, row.names = TRUE)

# Print a message indicating where the file was saved
cat("Healthcare dataset saved to:", csv_file_path, "\n")
