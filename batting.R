# Load the Lahman package 
if (!require("Lahman")) { 
  install.packages("Lahman") 
  library("Lahman") 
} 

#a. Create a scatterplot of the number of doubles hit in each year of baseball history. 
# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Filter the Batting dataset to include only yearID and X2B (doubles) 
batting_doubles <- Batting %>% 
  select(yearID, X2B) 

# Group the data by yearID and calculate the total number of doubles hit in each year 
total_doubles <- batting_doubles %>% 
  group_by(yearID) %>% 
  summarize(total_doubles = sum(X2B, na.rm = TRUE)) 

# Create a scatterplot of the number of doubles hit in each year of baseball history 
ggplot(total_doubles, aes(x = yearID, y = total_doubles)) + 
  geom_point() + 
  labs( 
    title = "Number of Doubles Hit in Each Year of Baseball History", 
    x = "Year", 
    y = "Total Doubles" 
  ) 

#b Create a scatterplot of the number of doubles hit in each year, in each league. Show only the 
leagues ‗NL‘ and ‗AL‘, and color the NL blue and the AL red 

# Load the Lahman package 
if (!require("Lahman")) { 
  install.packages("Lahman") 
  library("Lahman") 
} 

# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Filter the Batting dataset to include only yearID, lgID (league), and X2B (doubles) 
batting_subset <- Batting %>%
  select(yearID, lgID, X2B) 

# Filter the data to include only NL and AL leagues 
batting_filtered <- batting_subset %>% 
  filter(lgID %in% c("NL", "AL")) 

# Group the data by yearID and lgID, and calculate the total number of doubles hit in each year for 
each league 
total_doubles_league <- batting_filtered %>% 
  group_by(yearID, lgID) %>% 
  summarize(total_doubles = sum(X2B, na.rm = TRUE)) 

# Create a scatterplot with color differentiation for NL and AL leagues 
ggplot(total_doubles_league, aes(x = yearID, y = total_doubles, color = lgID)) + 
  geom_point() + 
  scale_color_manual(values = c("NL" = "blue", "AL" = "red")) + 
  labs( 
    title = "Number of Doubles Hit in Each Year by League", 
    x = "Year", 
    y = "Total Doubles", 
    color = "League" 
  ) 

#c Create boxplots for total runs scored per year in the AL and the NL from 1969 to the present 

# Load the Lahman package 
if (!require("Lahman")) { 
  install.packages("Lahman") 
  library("Lahman") 
} 

# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Filter the Batting dataset to include only relevant variables 
batting_subset <- Batting %>% 
  select(yearID, lgID, R)  

# Filter the data to include years from 1969 to present and only NL and AL leagues 
filtered_data <- batting_subset %>% 
  filter(yearID >= 1969, lgID %in% c("NL", "AL")) 

# Group the filtered data by yearID and lgID, and calculate total runs scored in each year for each 
league 
total_runs_per_year <- filtered_data %>% 
  group_by(yearID, lgID) %>% 
  summarize(total_runs = sum(R, na.rm = TRUE)) 

# Create boxplots for total runs scored per year in AL and NL separately 
ggplot(total_runs_per_year, aes(x = factor(yearID), y = total_runs, fill = lgID)) + 
  geom_boxplot() + 
  scale_fill_manual(values = c("NL" = "blue", "AL" = "red")) + 
  labs( 
    title = "Total Runs Scored per Year in AL and NL (1969-present)", 
    x = "Year", 
    y = "Total Runs", 
    fill = "League" 
  ) + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) 

#d Create a histogram of lifetime batting averages (H/AB) for all players who have at least 1000 
career AB‘s. 
# Load the Lahman package 
if (!require("Lahman")) { 
  install.packages("Lahman") 
  library("Lahman") 
} 

# Load required libraries 
library(dplyr) 
library(ggplot2) 

# Filter the Batting dataset to include relevant variables 
batting_subset <- Batting %>% 
  select(playerID, AB, H) 

# Group the data by playerID and calculate total at-bats (AB) and hits (H) for each player 
career_stats <- batting_subset %>% 
  group_by(playerID) %>% 
  summarize(total_AB = sum(AB, na.rm = TRUE), 
            total_H = sum(H, na.rm = TRUE)) 

# Filter the data to keep only players with at least 1000 career at-bats 
career_stats_filtered <- career_stats %>% 
  filter(total_AB >= 1000) 

# Calculate lifetime batting average (H/AB) for each player 
career_stats_filtered <- career_stats_filtered %>% 
  mutate(batting_avg = total_H / total_AB) 

# Create a histogram of lifetime batting averages 
ggplot(career_stats_filtered, aes(x = batting_avg)) + 
  geom_histogram(binwidth = 0.01, fill = "skyblue", color = "black") + 
  labs( 
    title = "Histogram of Lifetime Batting Averages", 
    x = "Batting Average (H/AB)", 
    y = "Frequency" 
  ) + 
  theme_minimal()