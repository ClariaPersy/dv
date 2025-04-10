Code: 
  install.packages("ggplot2") 
library(ggplot2) 
# Load the mtcars dataset 
data(mtcars) 

# Scatterplot with categorical coloring by number of cylinders 
ggplot(mtcars, aes(x = mpg, y = hp, color = factor(cyl))) + 
  geom_point() + 
  labs(title = "Highway Mileage vs. City Mileage", 
       x = "Highway Mileage (mpg)", 
       y = "City Mileage (hp)", 
       color = "Number of Cylinders") + 
  theme_minimal() 

# Scatterplot with sequential coloring by number of cylinders 
ggplot(mtcars, aes(x = mpg, y = hp, color = cyl)) + 
  geom_point() + 
  labs(title = "Highway Mileage vs. City Mileage", 
       x = "Highway Mileage (mpg)", 
       y = "City Mileage (hp)",  color = "Number of Cylinders") +  scale_color_gradient(low = 
                                                                                          "blue", high = "red") +   theme_minimal()