Code: 
  library(fosdata) 
# Load the pres_election dataset 
data(pres_election) 

# Load the required library 
library(dplyr) 
library(ggplot2) 

# Aggregate the total number of votes received by each political party for each election year 
party_votes <- pres_election %>% 
  group_by(year, party) %>% 
  summarise(total_votes = sum(totalvotes)) 

# Create bar charts for each election year 
ggplot(party_votes, aes(x = party, y = total_votes, fill = party)) + geom_bar(stat = "identity") + 
  facet_wrap(~ year, scales = "free_x", nrow = 1) + labs(title = "Total Votes by Political Party (2010
2016)", x = "Political Party", y = "Total Votes", fill = "Political Party") + theme(axis.text.x = 
                                                                                      element_text(angle = 45, hjust = 1)) +  scale_fill_brewer(palette = "Set3")