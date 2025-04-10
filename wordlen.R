
install.packages("remotes") 
remotes::install_github("speegled/fosdata") 
library(fosdata) 

# Step 2: Load the "austen" dataset 
data(austen) 

# Step 3: Calculate the word lengths 
austen$word_length <- nchar(austen$word) 

# Step 4: Create a barplot faceted by novel 
library(ggplot2) 
ggplot(austen, aes(x = word_length)) + 
  geom_bar() + 
  facet_wrap(~ novel, scales = "free") + 
  labs(title = "Word Lengths Faceted by Novel", 
       x = "Word Length", 
       y = "Frequency")
