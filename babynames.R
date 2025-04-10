a. Make a line graph of the total number of babies of each sex versus year 

# Install and load the babynames package if not already installed 
if (!require(babynames)) { 
  install.packages("babynames") 
  library(babynames) 
} 
# Load required libraries 
library(dplyr) 
library(ggplot2) 

# a) Make a line graph of the total number of babies of each sex versus year 
total_babies <- babynames %>% 
  group_by(year, sex) %>% 
  summarize(total_babies = sum(n)) 

ggplot(total_babies, aes(x = year, y = total_babies, color = sex, group = sex)) + 
  geom_line() + 
  labs(title = "Total Number of Babies by Sex and Year", 
       x = "Year", 
       y = "Total Babies") 

b. Make a line graph of the number of different names used for each sex versus year 

# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Group the data by year and sex, count the number of unique names 
unique_names <- babynames %>% 
  group_by(year, sex) %>% 
  summarize(num_unique_names = n_distinct(name)) 

# Plot the line graph 
ggplot(unique_names, aes(x = year, y = num_unique_names, color = sex, group = sex)) + 
  geom_line() + 
  labs(title = "Number of Different Names Used by Sex and Year", 
       x = "Year", 
       y = "Number of Unique Names") 

c. Make a line graph of the total number of babies with your name versus year. If your name doesn‘t 
appear in the data, use the name ―Alexa 

# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Set your name 
your_name <- "Your Name"

# Filter the dataset for your name, or "Alexa" if your name doesn't appear 
filtered_data <- babynames %>% 
  filter(name == ifelse(your_name %in% unique(babynames$name), your_name, "Alexa")) 

# Group the filtered data by year and calculate the total number of babies 
total_babies <- filtered_data %>% 
  group_by(year) %>% 
  summarize(total_babies = sum(n)) 

# Plot the line graph 
ggplot(total_babies, aes(x = year, y = total_babies)) + 
  geom_line() + 
  labs(title = paste("Total Number of Babies Named", ifelse(your_name %in% 
                                                              unique(babynames$name), your_name, "Alexa"), "by Year"), 
       x = "Year", 
       y = "Total Babies") 

d. Make a line graph comparing the number of boys named Bryan and the number of boys named 
Brian from 1920 to the present 
# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Filter the dataset for names "Bryan" and "Brian" for boys from 1920 to the present 
filtered_data <- babynames %>% 
  filter(name %in% c("Bryan", "Brian"), sex == "M", year >= 1920) 

# Group the filtered data by year and name, and calculate the total number of babies 
total_babies <- filtered_data %>% 
  group_by(year, name) %>% 
  summarize(total_babies = sum(n)) 

# Plot the line graph 
ggplot(total_babies, aes(x = year, y = total_babies, color = name, group = name)) + 
  geom_line() + 
  labs(title = "Comparison of Boys Named Bryan and Brian", 
       x = "Year", 
       y = "Total Babies")