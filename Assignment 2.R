<<<<<<< HEAD
library(tidyverse)
library(here)
us_states <- read.csv(here("covid-19-data","us-states.csv"))
us_states
library(dplyr)
Pennsylvania <- filter(us_states , state == "Pennsylvania")

#   Failure to remember to set incremental cases and deaths to levels on row 1: -10 
#   Failure to implement for() loop successfully: -10 

Incr_cases <- us_states %>%
  mutate(cases = cases)
Incr_deaths <- us_states %>% 
    mutate(deaths = deaths)
sd(us_states$Incr_cases)
=======

>>>>>>> main
