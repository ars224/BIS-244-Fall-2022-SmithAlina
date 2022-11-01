library(tidyverse)
library(here)
WOT_df <- read.csv("WOT.csv")

WOT_df$WR <- as.numeric(gsub("%","",WOT_df$WR))
df1$x1 <- gsub("1","",as.character(df1$x1))


#Filter out any tanks played 3 or less games on 
library(dplyr)
WOT_df <- filter(WOT_df , WOT_df$Battles > 3)


plot_a <- ggplot(data = WOT_df) + geom_boxplot(mapping = aes(x=Nation , y=WR))
plot_b <- ggplot(data = WOT_df) +geom_boxplot(mapping = aes(x=Class , y=WR))

gridExtra::grid.arrange(
  plot_a,
  plot_b,
  ncol = 2)