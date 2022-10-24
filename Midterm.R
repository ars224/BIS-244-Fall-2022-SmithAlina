library(tidyverse)
library(here)
#Import Netflix TV and Movies Data
Movies <- read.csv(file.choose())

#Filter data to only include Movies 
library(dplyr)
Movies <- filter(Movies, type=="Movie")

# Replacing rating with general term "Unrated"

#Categorizing 
library(dplyr)
Movies <- rename(rating, 
                 "PG"="Appropriate for 13 and Under",
                 "PG-13"="Appropriate for 13 and Under",
                 "G"="Appropriate for 13 and Under",
                 "TV-G"="Appropriate for 13 and Under",
                 "TV-PG"="Appropriate for 13 and Under",
                 "TV-Y"="Appropriate for 13 and Under",
                 "TV-Y7-FV"="Appropriate for 13 and Under"
                 )

