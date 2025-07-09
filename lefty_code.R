library(baseballr)
library(tidyverse)
library(data.table)
library(ggrepel)
library(patchwork)
library(shiny)
library(plotly)

# https://github.com/bwoodrum3/lefty-research/blob/main/lefty_data.csv
# https://raw.githubusercontent.com/bwoodrum3/lefty-research/main/lefty_data.csv

# Data Load
url <- "https://raw.githubusercontent.com/bwoodrum3/lefty-research/main/lefty_data.csv"
lefty_data <- read_csv(url)

lefty_data$WAR600 <- with(lefty_data, WAR/PA * 600)

pa250 <- lefty_data %>% filter(PA >= 250)
pa350 <- lefty_data %>% filter(PA >= 350)

# Visualizing the Data
plot1 <- ggplot(dat = pa350, aes(x = WAR600, y = `wRC+`, color = HitHand, lab = Last)) +
  geom_point(aes(size = PA)) +
  geom_hline(yintercept = 100, linetype = "dashed", color = "gray50") +       # wRC+ reference line
  geom_abline(slope = 10, intercept = 75, size=1.5, linetype = "dotted", color = "black") +  # y = x / 10 line
  # geom_text_repel(aes(label = Last), max.overlaps = 10) +
  # theme_minimal() +
  facet_wrap(~HitHand)

options(repr.plot.width = 12, repr.plot.height = 4)
print(plot1)

plot2 <- ggplot(dat = pa350, aes(y = WAR600, x = Season, color = HitHand)) +
  geom_point(aes(size = PA), alpha = 0.1) +
  geom_smooth(
    aes(group = HitHand),
    method = "lm", 
    se = FALSE, linewidth = 1, 
    linetype = "dotted", 
    color = "black") +  # Add regression lines per HitHand
  # geom_text_repel(aes(label = Last), max.overlaps = 10) +
  facet_wrap(~HitHand)

options(repr.plot.width = 12, repr.plot.height = 4)
print(plot2)

