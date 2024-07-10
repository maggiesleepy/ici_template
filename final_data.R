library(readxl)
library(readr)
library(ggplot2)
library(dplyr)
setwd("~/Desktop/Week3_eg_House")

edu_level <- read.csv("各縣市教育程度2014-2018.csv")
med_level <- read.csv("各縣市醫療資源2014-2018.csv")
house_price <- read.csv("縣市平均房價2014_2018.csv")
crime_rate <- read.csv("2014~2018 犯罪率.csv")
total_population <- read.csv("各縣市總人口2014-2018.csv")
earthquake <- read.csv("south_earthquake_intensity.csv")

#建立dataframe
earthquake$crime_rate <- crime_rate$犯罪率
earthquake$edu_level <- edu_level$Edu_Rate

sorted_med_level <- med_level %>% 
  arrange(County)
sorted_earthquake <- earthquake %>% 
  arrange(縣市名稱)
sorted_house_price <- house_price %>% 
  arrange(county)
sorted_total_population <- total_population %>% 
  arrange(County)
sorted_total_population

sorted_earthquake$med_level <- sorted_med_level$Service_per
sorted_earthquake$house_price <- sorted_house_price$縣市平均房價
sorted_earthquake$county_population <- sorted_total_population$Total

sorted_earthquake <- sorted_earthquake %>%
  rename(
    county=縣市名稱,
    earthquake_magnitude=地震級數
 )

#regression
house_price_model<-lm(log(house_price) ~
                        log(earthquake_magnitude + 0.1) + crime_rate + edu_level + med_level+
                        as.factor(year) + as.factor(county), data=sorted_earthquake) 
summary(house_price_model)

#regression for 2014
data_2014 <-sorted_earthquake[sorted_earthquake$year == 2014, ]
house_price_2014<-lm(house_price~earthquake_magnitude, data=data_2014) 
summary(house_price_2014)

#regression for 2016
data_2016 <-sorted_earthquake[sorted_earthquake$year == 2016, ]

house_price_2016<-lm(house_price~earthquake_magnitude, data=data_2016) 
summary(house_price_2016)

# 0531 revision ----------------------------------------------------------------------------------------------
new_house_price <- read.csv("雲嘉南高屏房價2015_2017_clean.csv")
new_edu_pop_med <- read.csv("雲嘉嘉南高屏_鄉鎮區人口教育醫療程度.csv")
town_list <- read.csv("town_list.csv")
earthquake2016_4 <- read.csv("south_earthquake_intensity.csv")

#data cleaning
selected_cities <- c("高雄市", "臺南市", "嘉義市", "嘉義縣", "屏東縣", "雲林縣")
town_list_south <-town_list[town_list$county %in% selected_cities, ]


#add new column eg:差額
new_house_price$price_gap_2015_2017 <- new_house_price$Avg_HousePrice_per_py_2017 - new_house_price$Avg_HousePrice_per_py_2015
new_house_price$trade_gap_2015_2017 <- new_house_price$Number_of_cases_2017 - new_house_price$Number_of_cases_2015

#sort the dataframe
sorted_new_house_price <- new_house_price %>% 
  arrange(TOWN_ID)
sorted_earthquake2016_4 <- earthquake2016_4 %>% 
  arrange(county_id)
sorted_new_edu_pop_med <- new_edu_pop_med %>% 
  arrange(TOWN_ID)

#merge the dataframe

sorted_earthquake2016_4$med_level <- sorted_new_edu_pop_med$Medi_Service_per
sorted_earthquake2016_4$university <- sorted_new_edu_pop_med$Number_of_university
sorted_earthquake2016_4$population <- sorted_new_edu_pop_med$Totalpop

final_data <- sorted_new_house_price %>%
  left_join(select(sorted_new_edu_pop_med,TOWN_ID, Medi_Service_per, Number_of_university, Totalpop), by = "TOWN_ID")

final_data$magnitude_level <- sorted_earthquake2016_4$Magnitude
final_data$price_gap_2016_2017 <- new_house_price$Avg_HousePrice_per_py_2017 - new_house_price$Avg_HousePrice_per_py_2016
final_data$trade_gap_2016_2017 <- new_house_price$Number_of_cases_2017 - new_house_price$Number_of_cases_2016
final_data$higher_edu <- sorted_new_edu_pop_med$Number_of_university+sorted_new_edu_pop_med$Number_of_high_school

#regression, using final_data

house_price_model_1<-lm(log(price_gap_2015_2017+.1) ~
                        Medi_Service_per + Number_of_university+
                        Totalpop + magnitude_level, data=final_data) 
summary(house_price_model_1)

house_price_model_2<-lm(price_gap_2016_2017~
                        Medi_Service_per + Number_of_university+
                        Totalpop + magnitude_level, data=final_data) 
summary(house_price_model_2)

house_price_model_3<-lm(log(price_gap_2016_2017+.1)~
                        Medi_Service_per + Number_of_university+
                        Totalpop + magnitude_level, data=final_data) 
summary(house_price_model_3)

house_price_model_4<-lm(price_gap_2016_2017~
                        Medi_Service_per + Number_of_university+
                        Totalpop + magnitude_level, data=final_data) 
summary(house_price_model_4)

house_price_model_5<-lm(trade_gap_2015_2017~
                          Medi_Service_per + Number_of_university+
                          Totalpop + magnitude_level, data=final_data) 
summary(house_price_model_5)

house_price_model_6<-lm(trade_gap_2016_2017~
                          Medi_Service_per + Number_of_university+
                          Totalpop + magnitude_level, data=final_data) 
summary(house_price_model_6)

house_price_model_7<-lm(log(trade_gap_2016_2017+.1)~
                          Medi_Service_per +higher_edu +
                          Totalpop + magnitude_level, data=final_data)
summary(house_price_model_7)

house_price_model_8<-lm(log(trade_gap_2015_2017+.1)~
                          Medi_Service_per + higher_edu+
                          Totalpop + magnitude_level, data=final_data)
summary(house_price_model_8)

write.csv(final_data, "final_data.csv", row.names = FALSE)

# 0601 revision before meeting ----------------------------------------------------------------------------------------------
final_data <- read.csv("final_data.csv")
income_tax <- read.csv("105年綜合所得稅所得總額申報統計_鄉鎮市區.csv")
edu_pop <- read.csv("105年行政區15歲以上人口教育程度統計_鄉鎮市區 .csv")

#data cleaning
income_tax <- income_tax %>%
  filter(!TAG %in% c("標籤", "X"))

edu_pop <- edu_pop %>%
  filter(!COUNTY_ID %in% c("縣市代碼"))

income_tax <- income_tax %>% 
  arrange(TOWN_ID)

edu_pop <- edu_pop %>%
  arrange(TOWN_ID)

#轉換data type
income_tax$FLD03 <- as.numeric(as.character(income_tax$FLD03))
#加入average total income to final data
final_data$Ave_Income <- income_tax$FLD03

#轉換data type
edu_pop$E1314_CNT <- as.numeric(as.character(edu_pop$E1314_CNT))
edu_pop$E1112_CNT <- as.numeric(as.character(edu_pop$E1112_CNT))
edu_pop$E2122_CNT <- as.numeric(as.character(edu_pop$E1314_CNT))

edu_pop$dr_ma_uni_pop <- edu_pop$E1314_CNT + edu_pop$E1112_CNT + edu_pop$E2122_CNT
#加入 proportion of the population of doctor, master, university graduates to final data
final_data$Dr_Ma_Uni_Pop <- edu_pop$dr_ma_uni_pop
final_data$Proportion_Dr_Ma_Uni_Pop <- final_data$Dr_Ma_Uni_Pop/final_data$Totalpop

#new regression
#model 1 沒有顯著, Adjusted R-squared:  -0.009942 
new_house_price_model_1<-lm(price_gap_2015_2017 ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_1)

#model 2 intercept**、Proportion_Dr_Ma_Uni_Pop**、Ave_Income*、Medi_Service_per .,Ad R-squared:  0.07069 
new_house_price_model_2<-lm(log(price_gap_2015_2017+.1)~
                              Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                              Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_2)

#model 3 沒有顯著, Adjusted R-squared:  -0.007835 
new_house_price_model_3<-lm(price_gap_2016_2017~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_3)

#model 4 intercept有顯著*, Adjusted R-squared:  -0.00704 
new_house_price_model_4<-lm(log(price_gap_2016_2017+.1)~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_4)

#model 5 total pop 有顯著**, Adjusted R-squared:  0.111 
new_house_price_model_5<-lm(trade_gap_2015_2017~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_5)

#model 6 intercept有顯著* Proportion_Dr_Ma_Uni_Pop、Ave_Income 接近顯著., Adjusted R-squared:  -0.004103 
new_house_price_model_6<-lm(trade_gap_2016_2017~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_6)

#model 7 Proportion_Dr_Ma_Uni_Pop***, Adjusted R-squared:  0.4387 
new_house_price_model_7<-lm(log(trade_gap_2015_2017+.1)~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_7)

#model 8 沒有顯著, Adjusted R-squared:  -0.02628 
new_house_price_model_8<-lm(log(trade_gap_2016_2017+.1)~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data) 
summary(new_house_price_model_8)

#0601 revision after meeting ----------------------------------------------------------------------------------------------
#Since the regression models above doesn't show a significant result, so I try a different data cleaning approach on the housing data and produce a new dataset.
#the files name of the new dataset is House_Land_Price_2015_2017
#data:House_Land_Price_2015_2017

House_Land_Price_2015_2017 <- read.csv("House_Land_Price_2015_2017.csv")
colnames(final_data)
colnames(House_Land_Price_2015_2017)
names(House_Land_Price_2015_2017)[15] <- "Total_House_Price_2016"
names(House_Land_Price_2015_2017)[19] <- "Total_Land_Price_2016"

#找出 2015~2017 每坪房價、單價元每坪、總價元、交易量的gap
final_data_1 <- House_Land_Price_2015_2017

final_data_1$gap_Avg_House_Price_per_Ping_15_17 <- House_Land_Price_2015_2017$Avg_House_Price_per_Ping_2017 -House_Land_Price_2015_2017$Avg_House_Price_per_Ping_2015

final_data_1$gap_Original_Avg_House_Price_per_Ping_15_17 <- House_Land_Price_2015_2017$Original_Avg_House_Price_per_Ping_2017 -House_Land_Price_2015_2017$Original_Avg_House_Price_per_Ping_2015

final_data_1$gap_Total_House_Price_15_17 <- House_Land_Price_2015_2017$Total_House_Price_2017 -House_Land_Price_2015_2017$Total_House_Price_2015

final_data_1$gap_number_of_house_trade_15_17 <- House_Land_Price_2015_2017$number_of_house_trade_2017 -House_Land_Price_2015_2017$number_of_house_trade_2015

#找出 2016~2017 每坪房價、單價元每坪、總價元、交易量的gap
final_data_1$gap_Avg_House_Price_per_Ping_16_17 <- House_Land_Price_2015_2017$Avg_House_Price_per_Ping_2017 -House_Land_Price_2015_2017$Avg_House_Price_per_Ping_2016

final_data_1$gap_Original_Avg_House_Price_per_Ping_16_17 <- House_Land_Price_2015_2017$Original_Avg_House_Price_per_Ping_2017 -House_Land_Price_2015_2017$Original_Avg_House_Price_per_Ping_2016

final_data_1$gap_Total_House_Price_16_17 <- House_Land_Price_2015_2017$Total_House_Price_2017 - House_Land_Price_2015_2017$Total_House_Price_2016

final_data_1$gap_number_of_house_trade_16_17 <- House_Land_Price_2015_2017$number_of_house_trade_2017 -House_Land_Price_2015_2017$number_of_house_trade_2016

#把舊column放過來final_data_1
final_data_1$Medi_Service_per <- final_data$Medi_Service_per
final_data_1$Ave_Income <- final_data$Ave_Income
final_data_1$Dr_Ma_Uni_Pop <- final_data$Dr_Ma_Uni_Pop
final_data_1$Proportion_Dr_Ma_Uni_Pop <- final_data$Proportion_Dr_Ma_Uni_Pop
final_data_1$magnitude_level <- final_data$magnitude_level
final_data_1$Totalpop <- final_data$Totalpop

#輸出data
write.csv(final_data_1, "final_data_1.csv", row.names = FALSE)

#new data new regression, using final_data_1

#M1
#都不顯著
new_data_hp_model_1<-lm(gap_Avg_House_Price_per_Ping_15_17 ~ Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                              Totalpop + magnitude_level + Ave_Income, data=final_data_1) 
summary(new_data_hp_model_1)

# M1-1 log
#Intercept***, Medi_Service_per*, Adjusted R-squared:  0.01344
new_data_hp_model_1_1<-lm(log(gap_Avg_House_Price_per_Ping_15_17+.1) ~ Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level + Ave_Income, data=final_data_1) 
summary(new_data_hp_model_1_1)

#Model 2
#Medi_Service_per*, magnitude_level., AD_R_square 0.04031
#聯展選擇這個模型
#聯展意見：Ave income =>改中位數，把 2015 & 2017 分開跑回歸
housing_price_model<-lm(gap_Original_Avg_House_Price_per_Ping_15_17 ~
                                   Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                                   Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(housing_price_model)

#M2-1 log
#Intercept*,Medi_Service_per., Adjusted R-squared:  0.01727 
new_data_hp_model_2_1<-lm(log(gap_Original_Avg_House_Price_per_Ping_15_17+.1) ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_2_1)

#M3
#都不顯著
new_data_hp_model_3<-lm(gap_Total_House_Price_15_17 ~
                                   Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                                   Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_3)

#M3-1 log
#intercept***, Adjusted R-squared:  -0.005312 
new_data_hp_model_3_1<-lm(log(gap_Total_House_Price_15_17+.1) ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_3_1)

#M4
#聯展選擇這個模型
#Intercept*, Totalpop***, magnitude_level.,Adjusted R-squared:  0.1243

housing_trade_model<-lm(gap_number_of_house_trade_15_17 ~
                                   Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                                   Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(housing_trade_model)



# 2016~2017
#Totalpop*, Adjusted R-squared:  0.01391
new_data_hp_model_5<-lm(gap_Avg_House_Price_per_Ping_16_17 ~ Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level + Ave_Income, data=final_data_1) 
summary(new_data_hp_model_5)

#log
#Intercept***,Ave_Income *,Adjusted R-squared:  0.0839 
new_data_hp_model_5_1<-lm(log(gap_Avg_House_Price_per_Ping_16_17+.1) ~ Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level + Ave_Income, data=final_data_1) 
summary(new_data_hp_model_5_1)

#magnitude_level***, Totalpop*, Intercept., Adjusted R-squared:  0.06878
new_data_hp_model_6<-lm(gap_Original_Avg_House_Price_per_Ping_16_17 ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_6)

#log
#Medi_Service_per.,Adjusted R-squared:  0.02191
new_data_hp_model_6_1<-lm(log(gap_Original_Avg_House_Price_per_Ping_16_17+.1) ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_6_1)

#Totalpop., Adjusted R-squared:  -0.002149
new_data_hp_model_7<-lm(gap_Total_House_Price_16_17 ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_7)

#log
#Intercept***, Adjusted R-squared:  -0.0645 
new_data_hp_model_7_1<-lm(log(gap_Total_House_Price_16_17+.1) ~
                          Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                          Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_hp_model_7_1)

#Totalpop*, Adjusted R-squared:  0.03094 
new_data_house_price_model_8<-lm(gap_number_of_house_trade_16_17 ~
                                   Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                                   Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(new_data_house_price_model_8)

# the regression models used in the final paper-----------------------------------------------------------------

#2016 price
hp_2016_model<-lm(Original_Avg_House_Price_per_Ping_2016 ~
                    Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                    Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(hp_2016_model)

#2016 trade
ht_2016_model<-lm(number_of_house_trade_2016 ~
                    Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                    Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(ht_2016_model)

#2016 price with a lag term:2015
hp_2016_model_lag<-lm(Original_Avg_House_Price_per_Ping_2016 ~
                        Original_Avg_House_Price_per_Ping_2015 + Medi_Service_per + Totalpop 
                      + Ave_Income + Proportion_Dr_Ma_Uni_Pop + magnitude_level, data=final_data_1) 
summary(hp_2016_model_lag)

#2016 trade with a lag term:2015
ht_2016_model_lag<-lm(number_of_house_trade_2016 ~
                        number_of_house_trade_2015+Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+
                        Totalpop + magnitude_level+Ave_Income, data=final_data_1) 
summary(ht_2016_model_lag)
