library(tidyverse)
library(here)
#Import covid-19 data 
Counties_2020 <- read.csv(here("covid-19-data","us-counties-2020.csv"))
Counties_2021 <- read.csv(here("covid-19-data","us-counties-2021.csv"))
Counties_2022 <- read.csv(here("covid-19-data","us-counties-2022.csv"))
recent <- read_csv(here("covid-19-data","us-counties-recent.csv"))
live <- read_csv(here("covid-19-data","live","us-counties.csv"))

#Combine Data

Combined <- rbind(Counties_2020, Counties_2021, Counties_2022, recent, live)



#Filter Data For PA and Lehigh 
library(dplyr)
CountiesPA <- filter(Combined, state == "Pennsylvania")
view(CountiesPA)

Lehigh <- filter(CountiesPA, county == "Lehigh")
view(Lehigh)

#Removal of duplicate dates
library(dplyr)
Lehigh <- distinct(Lehigh, date,.keep_all = TRUE)


#Number of new cases 
Lehigh$incr_cases <- 2
n <- length(Lehigh$date)
Lehigh$incr_cases[1] <- Lehigh$cases[1]
Lehigh$incr_cases <- 2
for (i in 2:n) {
  Lehigh$incr_cases[i] <- (Lehigh$cases[i]-Lehigh$cases[i-1])
}
view(Lehigh)

#Graph
p <- ggplot(data = Lehigh)

p+ geom_line(color="black",mapping = aes(x = date, y = incr_cases),group=1)+
  labs(x = "Date", y = "New Cases",
       title = "COVID-19 Cases Reported in Lehigh, PA")

