## The way to install REmap
#install.packages("devtools")
#library(devtools)
#install_github('lchiffon/REmap')

 

library(REmap)
library(dplyr)
rm(list=ls())
Sys.setlocale("LC_ALL","Chinese")
city_num <- read.csv("qingqian/city_num.csv",sep="\t",fileEncoding = "utf-8")[,-1]

cities = city_num$city
cities = as.character(cities)
cities_Geo <- get_geo_position(cities)
write.csv(cities_Geo, file="R_Geo.csv")
#city_num
data_final <- cities_Geo %>% 
  left_join(city_num)

data_final <- data_final[,-3]
#temp_file <- data.frame(cites_Geo,city_num$num)[,-3]
#names(temp_file)[names(temp_file)=="city_num.num"]="num"

remapH(data_final,
       maptype = "china",
       theme = get_theme("Bright"),
       blurSize = 35,
       color="red",
       minAlpha = 10,
       opacity = 2)
