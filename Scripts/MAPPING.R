if (!require("ggplot2", character.only = TRUE)) {
  install.packages("ggplot2")
  library(ggplot2)
}
if (!require("dplyr", character.only = TRUE)) {
  install.packages("dplyr")
  library(dplyr)
}
if (!require("rnaturalearth", character.only = TRUE)) {
  install.packages("rnaturalearth")
  library(rnaturalearth)
}

if (!require("rnaturalearthdata", character.only = TRUE)) {
  install.packages("rnaturalearthdata")
  library(rnaturalearthdata)
}




# Load world map data
world <- ne_countries(scale = "medium", returnclass = "sf")

# Specify the countries to color
highlight_countries <- c("United States of America", "Italy", "Canada", "Australia", "Spain", "Germany", 
                         "United Kingdom", "France", "India", "Belgium", "Netherlands", "Greece", 
                         "Ireland", "Czech Republic", "Denmark", "Norway", "Sweden", "Argentina", 
                         "China", "Iceland", "Iran", "Japan", "Luxembourg", "Serbia", "South Africa", 
                         "South Korea")


# Create a new column to identify highlighted countries
world <- world %>%
  mutate(highlight = ifelse(admin %in% highlight_countries, "Census", "No census"))

# Plot the map
ggplot(data = world) +
  geom_sf(aes(fill = highlight), color = "black") +  # Fill by 'highlight' column
  scale_fill_manual(values = c("Census" = "blue", "No census" = "gray90")) +  # Define colors
  theme_minimal() +
  labs(fill = "Countries") +
  theme(legend.position = "bottom") +
  ggtitle ("World map of countries with some researcher in the census")
