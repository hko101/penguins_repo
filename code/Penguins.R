library(tidyverse)
chinstrap_data <- read_csv("data/chinstrap_data.csv")

adelie_data <- read_csv("data/adelie_data.csv")
gentoo_data <- read_csv("data/gentoo_data.csv")
penguin_data <- bind_rows(adelie_data, chinstrap_data)

penguin_data <- bind_rows(penguin_data, gentoo_data)
# 같은 이름을 써도 새로운 자료로 덮어 씀. 

pentuin_data_test <- bind_cols(adelie_data, chinstrap_data)
# row/colums의 개수가 안맞으면 바인딩 안됨.

table(penguin_data$Species)

write_csv(penguin_data, "data/penguin_data.csv")

library(ggplot2)
library(palmerpenguins)
dplyr::glimpse(penguins_raw)

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`, color = Island, shape = Sex) +
  geom_point() +
  scale_color_viridis_d(end = 0.7)

# Use `` for variable containing spaces

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`, color = Island, shape = Sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_shape_discrete(na.translate = TRUE, na.value = 18) +
  xlab("Body Mass (grams)") +
  scale_y_continuous(name = "Flipper Length (milimeters)") +
  theme_classic() +
  theme(axis.text = element_text(color = "black"))

# na.value = 16circle 17triangle 18diamond
# xlab("names") = scale_x_continuous(name = "names")


theme_cool <- theme_classic() +
  theme(axis.text = element_text(color = "black"))
# When applying, never use () after 'theme_cool

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, fill = Species) +
  geom_histogram() +
  theme_cool +
  scale_fill_brewer(palette = "Set1") +
  scale_y_continuous(limits = c(0, 30),
                     expand = expansion()) + # expand = expansion(0, 0, 0, 0)
  theme(legend.position = "top",
        legend.direction = "vertical")

ggplot(penguins_raw) +
  aes(x = Island, y = `Culmen Length (mm)`) +
  geom_boxplot() + 
  theme_cool 

ggplot(penguins_raw) +
  aes(x = Island, y = `Culmen Length (mm)`) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) + 
  theme_cool 

ggplot(penguins_raw) +
  aes(x = `Delta 15 N (o/oo)`, y = `Delta 13 C (o/oo)`) +
  geom_density_2d() + 
  geom_density2d_filled(alpha = 0.5) +
  geom_point() + # the order of plot commands indicates the order of the layers from bottom to the top 
  theme_cool +
  scale_x_continuous(limits = c(7, 10.5),
                     expand = expansion()) +
  scale_y_continuous(limits = c(-27.5, -23.5),
                     expand = expansion())

ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`, color = Island, shape = Sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_shape_discrete(na.translate = TRUE, na.value = 18) +
  xlab("Body Mass (grams)") +
  scale_y_continuous(name = "Flipper Length (milimeters)") +
  theme_classic() +
  theme(axis.text = element_text(color = "black")) +
  facet_grid(rows = vars(Species), cols = vars (studyName))
  #facet_wrap(~Species, ncol=1) 
#facet_wrap(vars(Species), ncol=1)

g1 <- ggplot(penguins_raw) +
  aes(x = `Body Mass (g)`, y = `Flipper Length (mm)`, color = Island, shape = Sex) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_shape_discrete(na.translate = TRUE, na.value = 18) +
  xlab("Body Mass (grams)") +
  scale_y_continuous(name = "Flipper Length (milimeters)") +
  theme_classic() +
  theme(axis.text = element_text(color = "black")) 
g1

g2 <- ggplot(penguins_raw) +
  aes(x = `Delta 15 N (o/oo)`, y = `Delta 13 C (o/oo)`) +
  geom_density_2d() + 
  geom_density2d_filled(alpha = 0.5, show.legend = FALSE) +
  geom_point() + # the order of plot commands indicates the order of the layers from bottom to the top 
  theme_cool +
  scale_x_continuous(limits = c(7, 10.5),
                     expand = expansion()) +
  scale_y_continuous(limits = c(-27.5, -23.5),
                     expand = expansion())

library(patchwork)

g1 + g2

g3 <- ggplot(penguins_raw) +
  aes(x = Island, y = `Culmen Length (mm)`) +
  geom_boxplot() +
  theme_cool

gg <- (g1 | g2) / g3
ggsave("figures/penguis_1.pdf", gg, height = 10, width = 10)
ggsave("figures/penguis_1.jpg", gg, height = 10, width = 10)
