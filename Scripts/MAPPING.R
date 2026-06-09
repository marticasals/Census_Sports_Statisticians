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
if (!require("sf", character.only = TRUE)) {
  install.packages("sf")
  library(sf)
}

# Load world map data
world <- ne_countries(scale = "medium", returnclass = "sf")

# Country frequencies (calculated from your table)
country_freq <- data.frame(
  country = c(
    "United States of America", "Italy", "Spain", "United Kingdom",
    "Canada", "Australia", "Belgium", "Germany", "Netherlands",
    "Sri Lanka", "India", "Ireland", "Greece", "Japan", "Sweden",
    "Luxembourg", "Denmark", "Czechia", "Norway", "France",
    "Switzerland", "Hungary", "Turkey"
  ),
  freq = c(
    23, 17, 13, 9,
    8, 7, 5, 4, 4,
    3, 3, 2, 2, 1, 1,
    1, 1, 1, 1, 1,
    1, 1, 1
  )
)

# Join frequencies to world map
world_freq <- world %>%
  left_join(country_freq, by = c("admin" = "country"))

# Plot 1
ggplot(data = world_freq) +
  geom_sf(aes(fill = freq), color = "black", linewidth = 0.2) +
  scale_fill_gradient(
    low = "lightblue",
    high = "darkblue",
    na.value = "gray90",
    name = "Frequency"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom") +
  ggtitle("World map of countries with researchers in the census")

# Plot 2
ggplot(data = world_freq) +
  geom_sf(aes(fill = freq), color = "black", linewidth = 0.2) +
  scale_fill_gradient(
    low = "lightblue",
    high = "darkblue",
    na.value = "gray90",
    name = "Frequency"
  ) +
  theme_void() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5)
  ) +
  ggtitle("World map of countries with researchers in the census")

