# Two variable number
set.seed(42) # lock result 
ggplot(diamonds %>%
         sample_frac(0.07), aes(carat, price, col = cut))+
  geom_point(size = 1, alpha = 0.5) +
  labs(
    title = "scatter plot",
    subtitle = "ggplot2",
    caption = "Data: diamonds in ggplot2",
    x = "carat's diamonds",
    y = "price(usd)") +
  theme_fivethirtyeight()
