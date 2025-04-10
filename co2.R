# Load necessary libraries  
library(ggplot2)  
# Load CO2 dataset  
data(CO2)  
# Convert Plant column to factor for proper facetting  
CO2$Plant <- as.factor(CO2$Plant)  
# Create the plot  
ggplot(CO2, aes(x = conc, y = uptake, color = Type)) +  
  geom_point() + # Scatterplot  
  geom_smooth(method = "lm", se = FALSE) + # Add a linear model fit line  
  facet_wrap(~Plant, scales = "free") + # Facet by Plant  
  labs(title = "CO2 Uptake vs Concentration by Plant Type",  
       x = "Concentration Level",  
       y = "CO2 Uptake") + # Labels  
  theme_minimal() # Theme  