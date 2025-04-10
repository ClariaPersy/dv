# Load necessary libraries 
library(tidyverse) 

# Convert the provided data into a tidy format 
scotland_births_tidy <- pivot_longer(scotland_births,  
                                     cols = -age,  
                                     names_to = "year",  
                                     values_to = "births") %>% 
  mutate(year = as.numeric(str_remove(year, "x"))) %>% 
  filter(year >= 1945) 

# Plot births by year for each age group 
ggplot(scotland_births_tidy, aes(x = year, y = births, color = as.factor(age))) + 
  geom_line() + 
  scale_color_manual(values = c("20" = "blue", "30" = "red", "other" = "gray")) + 
  theme_minimal() + 
  labs(title = "Births by Year for Each Age Group", 
       x = "Year", 
       y = "Number of Births",color = "Age Group") + 
  theme(legend.position = "bottom") 