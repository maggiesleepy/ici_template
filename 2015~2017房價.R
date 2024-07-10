library(readxl)
library(readr)
library(ggplot2)
library(dplyr)
library(stringr)

#merge2015~2017 dataset
House_Land_Price_2015 <- read.csv("House_Land_Price_2015.csv")
House_Land_Price_2016 <- read.csv("House_Land_Price_2016.csv")
House_Land_Price_2017 <- read.csv("House_Land_Price_2017.csv")


selected_columns_16 <- House_Land_Price_2016[, 4:12]
selected_columns_17 <- House_Land_Price_2017[, 4:12]

House_Land_Price_2015_2017 <- House_Land_Price_2015
House_Land_Price_2015_2017 <- left_join(House_Land_Price_2015_2017,selected_columns_16, by = "鄉鎮市區")
House_Land_Price_2015_2017 <- left_join(House_Land_Price_2015_2017,selected_columns_17, by = "鄉鎮市區")
View(House_Land_Price_2015_2017)

#修改observation：把townlist中的嘉義市變回嘉義東區＆西區

chaiyi2015_2017 <-House_Land_Price_2015_2017[House_Land_Price_2015_2017$county == "嘉義市", ]
chaiyi2015_2017[1, 1] <- "10020010"
chaiyi2015_2017[1, 3] <- "東區"
chaiyi2015_2017[1, 4] <- "東區"
View(chaiyi2015_2017)

chaiyi2015_2017_W <-House_Land_Price_2015_2017[House_Land_Price_2015_2017$county == "嘉義市", ]
chaiyi2015_2017_W[1, 1] <- "10020020"
chaiyi2015_2017_W[1, 3] <- "西區"
chaiyi2015_2017_W[1, 4] <- "西區"
View(chaiyi2015_2017_W)

#刪除嘉義市
House_Land_Price_2015_2017 <- House_Land_Price_2015_2017[-c(1),]

#rbind
House_Land_Price_2015_2017 <- rbind(House_Land_Price_2015_2017,chaiyi2015_2017,chaiyi2015_2017_W)

House_Land_Price_2015_2017 <- House_Land_Price_2015_2017 %>%
  arrange(TOWN_ID)


View(House_Land_Price_2015_2017)

write.csv(House_Land_Price_2015_2017, "House_Land_Price_2015_2017.csv", row.names = FALSE)
