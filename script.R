# Bibliotecas
library(tidyverse)
library(hrbrthemes)
library(babynames)
library(viridis)

a <- data.frame(x = rnorm(100), y = rnorm(100)) %>% mutate(y = y - x / 2)
b <- a %>% 
  mutate(x = x + 2) %>% 
  mutate(y = y + 2)
c <- a %>% mutate(x = x + 4) %>%
  mutate(y = y + 4)

data <- do.call(rbind, list(a, b, c))
data <- data %>% mutate(group = rep(c("A", "B", "C"), each = 100))

# Graph 1: overall regression
ggplot(data, aes(x = x, y = y)) +
  geom_point(size = 2, color = "#4d4d4d") +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, color = "#1D54D1", linewidth = 1.3) +
  theme_void()


custom_colors <- c("A" = "#C70039", "B" = "#4379B9", "C" = "#1E7511")
# Graph 2:regression by grou´p
ggplot(data, aes(x = x, y = y, color = group)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, linewidth = 1.3) +
  scale_color_manual(values = custom_colors) +
  theme_void() 

# Display the plots side by side
# library(gridExtra)
# grid.arrange(plot1, plot2, ncol = 2)
