install.packages("ggplot2")
library(ggplot2)
data(quakes)
ggplot(quakes, aes(x = long, y = lat, color = depth, size = mag)) + 
  geom_point() + 
  scale_color_gradient(low = "blue", high = "red") + 
  labs(title = "Earthquakes off Fiji in the 1960's", 
       x = "Longitude", y = "Latitude", color = "Depth", size = "Magnitude")

