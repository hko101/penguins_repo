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
