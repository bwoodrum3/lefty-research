library(baseballr)
library(tidyverse)
library(data.table)
library(ggrepel)
library(patchwork)
library(shiny)
library(plotly)

# https://github.com/bwoodrum3/lefty-research/blob/main/lefty_data.csv
# https://raw.githubusercontent.com/bwoodrum3/lefty-research/main/lefty_data.csv

url <- "https://raw.githubusercontent.com/bwoodrum3/lefty-research/main/lefty_data.csv"
lefty_data <- read_csv(url)

pa250 <- lefty_data %>% filter(PA >= 250)
pa350 <- lefty_data %>% filter(PA >= 350)

plot1 <- ggplot(dat=pa350, aes(x=WAR,y=`wRC+`,color=HitHand,
		lab=Last)) +
    geom_point(aes(color=HitHand, size=PA)) +
    # geom_text_repel(aes(label = Last), max.overlaps = 10) +
    theme_minimal()

