# Creating a weather forecast dataset
weather <- data.frame(
  temperature = c(15, 18, 20, 22, 25, 28, 30),  # Temperature in Celsius
  humidity = c(60, 65, 70, 72, 75, 78, 80),    # Humidity percentage
  rainy_day = c(0, 1, 1, 1, 0, 0, 1)            # Binary variable for rainy day (0: No, 1: Yes)
)
#I did it using weather dataset from kaggle 

# Displaying the created weather forecast dataset
print(weather)
# Load necessary libraries
library(ggplot2)

# Perform linear regression on the created weather dataset
lm_model <- lm(humidity ~ temperature, data = weather)

# Summary of linear regression model
summary(lm_model)

# Plotting the linear regression line
ggplot(weather, aes(x = temperature, y = humidity)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Linear Regression: Humidity vs Temperature")
# Add a binary variable 'high_humidity' indicating high humidity (>65%) or not
weather$high_humidity <- ifelse(weather$humidity > 65, 1, 0)

# Logistic regression model
logit_model <- glm(high_humidity ~ temperature + rainy_day, 
                   data = weather, family = binomial)

# Summary of logistic regression model
summary(logit_model)

# Plotting logistic regression isn't straightforward as linear regression due to classification nature.
# However, you can visualize the relationship between variables.

# For instance, you can visualize the relationship between Temperature and probability of high humidity.
ggplot(weather, aes(x = temperature, y = high_humidity)) +
  geom_point() +
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(title = "Logistic Regression: Probability of High Humidity vs Temperature")

