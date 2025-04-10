# Load required libraries 
library(dplyr) 
library(ggplot2) 
library(lubridate)  # For handling dates 

# Load the ecars dataset 
data(ecars) 

# Filter out web platform cars 
ecars_filtered <- ecars %>% 
  filter(platform != "web") 

# Convert dayOfWeek to factor with proper order 
ecars_filtered$weekday <- factor(ecars_filtered$weekday, levels = c("Sunday", "Monday", 
                                                                    "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")) 

# Create the scatterplot with facets 
ggplot(ecars_filtered, aes(x = chargeTimeHrs, y = kwhTotal)) + 
  geom_point() + 
  facet_grid(platform ~ weekday, scales = "free", space = "free", switch = "x") + 
  labs(title = "Scatterplot of Charge Time (Hours) vs. Total kWh by Day of Week and Platform", 
       x = "Charge Time (Hours)", 
       y = "Total kWh") + 
  theme_minimal() 