Code: 
  # Load the fosdata package 
  library(fosdata) 

# Load the austen dataset 
data(austen) 

# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Filter the dataset to include only the rows corresponding to the novel "Emma" 
emma_data <- austen %>%  
  filter(novel == "Emma") 

# Filter the dataset to include only words with non-zero sentiment scores 
emma_filtered <- emma_data %>% 
  filter(sentiment_score != 0) 

# Calculate the percentage of words with positive sentiment scores for each chapter 
positive_percentage <- emma_filtered %>% 
  group_by(chapter) %>% 
  summarise(positive_percentage = sum(sentiment_score > 0) / n() * 100) 

# Create scatterplot of percentage of positive words versus chapter 
ggplot(positive_percentage, aes(x = chapter, y = positive_percentage)) + 
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE, color = "blue") + 
  labs(title = "Percentage of Positive Words in Emma by Chapter", 
       x = "Chapter", 
       y = "Percentage of Positive Words") + 
  theme_minimal()