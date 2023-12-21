library(tidyverse)
library(rmarkdown)
head(mpg)
View(mpg)


ggplot(mpg, aes(class, fill = class)) +
  geom_bar() +
  facet_wrap(~ manufacturer) +
  theme_minimal()

ggplot(mpg, aes(hwy, cty, col = displ)) +
  geom_point(size = 2, alpha = 0.4) +
  geom_smooth(se = FALSE, size = 0.5, col = "brown2") +
  scale_color_gradient(low = "green4", high = "deepskyblue3") +
  theme_minimal() +
  labs(
    title = "Relationship between hwy and cty by displ",
    subtitle = "scatter plot",
    caption = "data: mpg",
    x = "hwy (miles/gallon)",
    y = "cty (miles/gallon)"
  )

ggplot(mpg %>%
         mutate(fl = case_when(
           fl == "c" ~ "compressed",
           fl == "d" ~ "diesel",
           fl == "e" ~ "ethanol",
           fl == "p" ~ "premium",
           TRUE ~ "regular")), aes(hwy, displ, col = fl)) +
  geom_point() +
  facet_wrap(~fl) +
  scale_colour_brewer(palette = "Set1") +
  theme_minimal() +
  labs(title = "Relationship between hwy and displ by fluel")


ggplot(mpg, aes(class, hwy, fill = class)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Pastel2") +
  labs(title = "Fuel Efficiency by Vehicle Class (Boxplots)") +
  theme_minimal()

ggplot(mpg %>%
         mutate(drv = case_when(
           drv == "4" ~ "4WD",
           drv == "r" ~ "rear wheel",
           TRUE ~"front wheel")), aes(hwy, displ, col = drv))+
  geom_point(size = 5, alpha = 0.2) +
  theme_minimal()+
  labs(
    title = "Relationship between hwy and displ by drv",
    subtitle = "scatter plot",
    caption = "data: mpg",
    x = "hwy (miles/gallon)",
    y = "displ (litters)"
  )
