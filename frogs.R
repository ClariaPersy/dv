Code: 
  # Load required libraries 
  library(ggplot2) 
library(fosdata) 

# Create scatterplot 
ggplot(data = frogs, aes(x = hl, y = fal, color = species)) + 
  geom_point() + 
  labs(x = "Head Length", y = "Forearm Length", color = "Species") + 
  ggtitle("Scatterplot of Head Length vs Forearm Length by Species")