library(readxl)
library(readr)
library(ggplot2)
library(dplyr)
library(stringr)

#rbind 2017 dataset
#嘉義市CYcity
hp_CYcity_2017_1 <- read.csv("I_lvr_land_A 嘉義市-2017-1.csv")
hp_CYcity_2017_2 <- read.csv("I_lvr_land_A 嘉義市-2017-2.csv")
hp_CYcity_2017_3 <- read.csv("I_lvr_land_A 嘉義市-2017-3.csv")
hp_CYcity_2017_4 <- read.csv("I_lvr_land_A 嘉義市-2017-4.csv")

hp_CYcity_2017 <- rbind(hp_CYcity_2017_1, hp_CYcity_2017_2)
hp_CYcity_2017 <- rbind(hp_CYcity_2017, hp_CYcity_2017_3)
hp_CYcity_2017 <- rbind(hp_CYcity_2017, hp_CYcity_2017_4)

#嘉義縣CY
hp_CY_2017_1 <- read.csv("Q_lvr_land_A 嘉義縣-2017-1.csv")
hp_CY_2017_2 <- read.csv("Q_lvr_land_A 嘉義縣-2017-2.csv")
hp_CY_2017_3 <- read.csv("Q_lvr_land_A 嘉義縣-2017-3.csv")
hp_CY_2017_4 <- read.csv("Q_lvr_land_A 嘉義縣-2017-4.csv")

hp_CY_2017 <- rbind(hp_CY_2017_1, hp_CY_2017_2)
hp_CY_2017 <- rbind(hp_CY_2017, hp_CY_2017_3)
hp_CY_2017 <- rbind(hp_CY_2017, hp_CY_2017_4)

#雲林Yunlin
hp_Yunlin_2017_1 <- read.csv("P_lvr_land_A 雲林-2017-1.csv")
hp_Yunlin_2017_2 <- read.csv("P_lvr_land_A 雲林-2017-2.csv")
hp_Yunlin_2017_3 <- read.csv("P_lvr_land_A 雲林-2017-3.csv")
hp_Yunlin_2017_4 <- read.csv("P_lvr_land_A 雲林-2017-4.csv")

hp_Yunlin_2017 <- rbind(hp_Yunlin_2017_1, hp_Yunlin_2017_2)
hp_Yunlin_2017 <- rbind(hp_Yunlin_2017, hp_Yunlin_2017_3)
hp_Yunlin_2017 <- rbind(hp_Yunlin_2017, hp_Yunlin_2017_4)

#台南Tainan
hp_Tainan_2017_1 <- read.csv("D_lvr_land_台南2017-1.csv")
hp_Tainan_2017_2 <- read.csv("D_lvr_land_台南2017-2.csv")
hp_Tainan_2017_3 <- read.csv("D_lvr_land_台南2017-3.csv")
hp_Tainan_2017_4 <- read.csv("D_lvr_land_台南2017-4.csv")

hp_Tainan_2017 <- rbind(hp_Tainan_2017_1, hp_Tainan_2017_2)
hp_Tainan_2017 <- rbind(hp_Tainan_2017, hp_Tainan_2017_3)
hp_Tainan_2017 <- rbind(hp_Tainan_2017, hp_Tainan_2017_4)

#高雄KH
hp_KH_2017_1 <- read.csv("E_lvr_land_A 高雄-2017-1.csv")
hp_KH_2017_2 <- read.csv("E_lvr_land_A 高雄-2017-2.csv")
hp_KH_2017_3 <- read.csv("E_lvr_land_A 高雄-2017-3.csv")
hp_KH_2017_4 <- read.csv("E_lvr_land_A 高雄-2017-4.csv")

hp_KH_2017 <- rbind(hp_KH_2017_1, hp_KH_2017_2)
hp_KH_2017 <- rbind(hp_KH_2017, hp_KH_2017_3)
hp_KH_2017 <- rbind(hp_KH_2017, hp_KH_2017_4)

#屏東PT
hp_PT_2017_1 <- read.csv("T_lvr_land_A 屏東-2017-1.csv")
hp_PT_2017_2 <- read.csv("T_lvr_land_A 屏東-2017-1.csv")
hp_PT_2017_3 <- read.csv("T_lvr_land_A 屏東-2017-1.csv")
hp_PT_2017_4 <- read.csv("T_lvr_land_A 屏東-2017-1.csv")

hp_PT_2017 <- rbind(hp_PT_2017_1, hp_PT_2017_2)
hp_PT_2017 <- rbind(hp_PT_2017, hp_PT_2017_3)
hp_PT_2017 <- rbind(hp_PT_2017, hp_PT_2017_4)

#加入TOWN_ID
town_list$鄉鎮市區 <- town_list$town

#filter出房地(土地+建物)，不含車位
House_hp_CYcity_2017 <- hp_CYcity_2017 %>%
  filter(交易標的 %in% c("房地(土地+建物)"))
House_hp_CYcity_2017$city <- "嘉義市"

House_hp_CY_2017 <- hp_CY_2017 %>%
  filter(交易標的 %in% c("房地(土地+建物)"))
House_hp_CY_2017$city <- "嘉義縣"

House_hp_Yunlin_2017 <- hp_Yunlin_2017 %>%
  filter(交易標的 %in% c("房地(土地+建物)"))
House_hp_Yunlin_2017$city <- "雲林市"

House_hp_Tainan_2017 <- hp_Tainan_2017 %>%
  filter(交易標的 %in% c("房地(土地+建物)"))
House_hp_Tainan_2017$city <- "臺南市"

House_hp_KH_2017 <- hp_KH_2017 %>%
  filter(交易標的 %in% c("房地(土地+建物)"))
House_hp_KH_2017$city <- "高雄市"

House_hp_PT_2017 <- hp_PT_2017 %>%
  filter(交易標的 %in% c("房地(土地+建物)"))
House_hp_PT_2017$city <- "屏東市"

House_hp_2017 <- rbind(House_hp_CYcity_2017,House_hp_CY_2017,House_hp_Yunlin_2017,House_hp_Tainan_2017,House_hp_KH_2017,House_hp_PT_2017)

#加上TOWN_ID
#House_hp_2017 <- left_join(House_hp_2017, town_list, by = "鄉鎮市區")

#House_hp_2017 <- House_hp_2017 %>%
#select((names(House_hp_2017)[ncol(House_hp_2017)-2]), everything())%>%
#select((names(House_hp_2017)[ncol(House_hp_2017)-1]), everything())

House_hp_2017$建物移轉總面積平方公尺 <- as.numeric(as.character(House_hp_2017$建物移轉總面積平方公尺))
House_hp_2017$總價元 <- as.numeric(as.character(House_hp_2017$總價元))
House_hp_2017$單價元平方公尺 <- as.numeric(as.character(House_hp_2017$單價元平方公尺))

#hp_CY_2017_1111 <- House_hp_2017%>%
#filter(county %in% c("嘉義市"))
House_hp_2017$建物移轉總面積坪 <- House_hp_2017$建物移轉總面積平方公尺/3.3
House_hp_2017$單價元每坪 <- House_hp_2017$單價元平方公尺/3.3

#House_hp_2017 <- House_hp_2017 %>%
  #mutate(city = substr(土地位置建物門牌, 1, 3))

#把city搬到前面的colu
House_hp_2017  <- House_hp_2017  %>%
  select((names(House_hp_2017)[ncol(House_hp_2017)-2]), everything())

House_hp_2017[18947, 2] <- "官田區"

House_hp_2017_1 <- House_hp_2017 %>%
  group_by(鄉鎮市區) %>%
  summarise(
    Avg_House_Price_per_Ping_2017 = sum(總價元, na.rm = TRUE) / sum(建物移轉總面積坪, na.rm = TRUE),
    Original_Avg_House_Price_per_Ping_2017=mean(單價元每坪, na.rm = TRUE),
    Total_House_Price_2017=mean(總價元, na.rm = TRUE),
    number_of_house_trade_2017=n(),
    .groups = 'drop')

print(House_hp_2017_1)

View(House_hp_2017_1)

#修改observation：台西鄉改臺西鄉
House_hp_2017_1[30, 1] <- "臺西鄉"

#House_hp_2017_1加到townlist裡面去
House_hp_2017_11 <- left_join(townlist, House_hp_2017_1, by = "鄉鎮市區")
House_hp_2017_11 <- House_hp_2017_11%>%
  filter(county %in% c("嘉義縣","嘉義市","雲林縣","高雄市","屏東縣","臺南市"))

View(House_hp_2017_11)

#filter出土地

Land_p_CYcity_2017 <- hp_CYcity_2017 %>%
  filter(交易標的 %in% c("土地"))
Land_p_CYcity_2017$city <- "嘉義市"

Land_p_CY_2017 <- hp_CY_2017 %>%
  filter(交易標的 %in% c("土地"))
Land_p_CY_2017$city <- "嘉義縣"

Land_p_Yunlin_2017 <- hp_Yunlin_2017 %>%
  filter(交易標的 %in% c("土地"))
Land_p_Yunlin_2017$city <- "雲林縣"

Land_p_Tainan_2017 <- hp_Tainan_2017 %>%
  filter(交易標的 %in% c("土地"))
Land_p_Tainan_2017$city <- "臺南市"

Land_p_KH_2017 <- hp_KH_2017 %>%
  filter(交易標的 %in% c("土地"))
Land_p_KH_2017$city <- "高雄市"

Land_p_PT_2017 <- hp_PT_2017 %>%
  filter(交易標的 %in% c("土地"))
Land_p_PT_2017$city <- "屏東縣"

Land_p_2017 <- rbind(Land_p_CYcity_2017,Land_p_CY_2017,Land_p_Yunlin_2017,Land_p_Tainan_2017,Land_p_KH_2017,Land_p_PT_2017)

#Land_p_2017 <- right_join(Land_p_2017, town_list, by = "鄉鎮市區")
#Land_p_2017 <- Land_p_2017 %>%
#select((names(Land_p_2017)[ncol(Land_p_2017)-2]), everything())%>%
#select((names(Land_p_2017)[ncol(Land_p_2017)-1]), everything())

#轉換數據形式：character to number
Land_p_2017$土地移轉總面積平方公尺 <- as.numeric(as.character(Land_p_2017$土地移轉總面積平方公尺))
Land_p_2017$總價元 <- as.numeric(as.character(Land_p_2017$總價元))
Land_p_2017$單價元平方公尺 <- as.numeric(as.character(Land_p_2017$單價元平方公尺))

#新增以坪數計算的column
Land_p_2017$土地移轉總面積坪 <- Land_p_2017$土地移轉總面積平方公尺/3.3
Land_p_2017$單價元每坪 <- Land_p_2017$單價元平方公尺/3.3

#把city拉到表格前面
Land_p_2017  <- Land_p_2017  %>%
  select((names(Land_p_2017)[ncol(Land_p_2017)-2]), everything())

#計算每坪均價

Land_p_2017_1 <- Land_p_2017 %>%
  group_by(鄉鎮市區) %>%
  summarise(
    Avg_Land_Price_per_Ping_2017 = sum(總價元, na.rm = TRUE) / sum(土地移轉總面積坪, na.rm = TRUE),
    Original_Avg_Land_Price_per_Ping_2017=mean(單價元每坪, na.rm = TRUE),
    Total_Land_Price_2017=mean(總價元, na.rm = TRUE),
    number_of_Land_trade_2017=n(),
    .groups = 'drop')

print(Land_p_2017_1)

View(Land_p_2017_1)

#修改Land_p_2017_1 的 observation：台西鄉改臺西鄉
Land_p_2017_1[30, 1] <- "臺西鄉"

#接下來用townlist

Land_p_2017_11 <- left_join(townlist, Land_p_2017_1, by = "鄉鎮市區")
Land_p_2017_11 <- Land_p_2017_11%>%
  filter(county %in% c("嘉義縣","嘉義市","雲林縣","高雄市","屏東縣","臺南市"))
View(Land_p_2017_11)

House_Land_Price_2017<- House_hp_2017_11
selected_columns <- Land_p_2017_11[, 4:8]
House_Land_Price_2017 <- left_join(House_Land_Price_2017, selected_columns, by = "鄉鎮市區")
View(House_Land_Price_2017)

write.csv(House_Land_Price_2017, "House_Land_Price_2017.csv", row.names = FALSE)
