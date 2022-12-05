library(gapminder)
library(tidyverse)
library(ggrepel)
library(socviz)

#Update

# Import data 

library(readr)
mass_shootings <- read_csv("mass_shootings.csv")
View(mass_shootings)

#map data frame
install.packages(c("maps","mapdata"))
library(maps)

#Failed to join the datasets : -30
us_states <- map_data("state")

mass_shootings$region <- tolower(mass_shootings$State)
mass_shootings_state <- left_join(us_states, mass_shootings)

#mass_shootings <- mass_shootings("State")
head(mass_shootings)
dim(mass_shootings)
p <- ggplot(data = mass_shootings_state,
            mapping = aes(x = long, y = lat,
                          group = group))

p + geom_polygon(fill = "white", color = "black")

# Make a theme for producing our map in the format we want
theme_map <- function(base_size=9, base_family="") {
  require(grid)
  theme_bw(base_size=base_size, base_family=base_family) %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.spacing=unit(0, "lines"),
          plot.background=element_blank(),
          legend.justification = c(0,0),
          legend.position = c(0,0)
    )
}

p0 <- ggplot(data = mass_shootings_state,
             mapping = aes(x = long, y = lat,
                           group = group, fill = mass_shootings_state$`# Killed`))
p1 <- p0 + geom_polygon(color = "gray90", size = 0.1) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) 

p2 <- p1 + scale_fill_manual(values = party_colors) +
  labs(title = "Mass Shootings 2013-2022", fill = NULL)
p2 + theme_map() + labs(fill = "Killed")

p3 <- p1 + scale_fill_gradient2(low = "red", mid = scales::muted("purple"),
                                high = "blue", breaks = c(-25, 0, 25, 50, 75)) +
  labs(title = "Mass Shootings") 
p3 + theme_map() + labs(fill = "Killed")
