# Project Title

The Influence of the June 2nd, 2016 Meinong Earthquake on the housing market in southern Taiwan

## Project Description

On April 3, 2024, a powerful earthquake with a magnitude of 7.2 struck eastern Taiwan in the Pacific Ocean. This earthquake is the strongest since the 0921 Earthquake, which had a magnitude of 7.3 and occurred in 1999.

A comparison between the two earthquakes reveals a significant decrease in casualties and damage caused by the 0403 Earthquake compared to the 0921 Earthquake. Notably, the number of houses damaged by the 0403 Earthquake is considerably lower than in the 921 event.

Given this reduction in damage, we are interested in exploring whether unexpected earthquakes could impact Taiwan's long-rising housing market. However, since the 0403 Earthquake is a recent event, the necessary data for evaluation is not yet available.

Therefore, we have chosen to examine the impact of another significant earthquake, the 0206 Meinong Earthquake in 2016. This earthquake has a magnitude of 6.4, and most of the damages occurred in the southern Taiwan counties. By analyzing the effects of the Meinong Earthquake on the housing market in southern Taiwan, we aim to gain insights into how a major earthquake event can influence housing market trends.


## Getting Started
To process all the datasets above, install RStudio first and make sure the R version is 4.2.3. Open RStudio and install the following libraries that we will later use in the data cleaning process first.

Library list:

| dplyr | stringr | readxl | readr |
|-------|---------|--------|-------|

In this project, we aim to determine if the 0206 Earthquake in 2016 influenced the housing market in southern Taiwan. Therefore, we focus on analyzing the data from 2015 to 2017 for every district in the southern Taiwan counties listed below. There are total of 148 districts in the following counties, which means that there are 148 observations in our dataset.

List of counties we focus on researching:

| Yunlin | Chiayi City | Chiayi   |
|--------|-------------|----------|
| Tainan | Kaohsiung   | Pingtung |

To examine the influence, we have considered several factors: seismic intensity of the 0206 earthquake, data of housing market, education level, average income, population, and medical resources in southern Taiwan.

We acquired data on all the factors from the following platforms:

| Factors                                  | Names of Datasets                                       | Resources Platform                                                                            |
|------------------------------------------|---------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Seismic Intensity of the 0206 Earthquake | Meinong Earthquake Seismic Intensity Table              | [Website of Central Weather Administration](https://scweb.cwa.gov.tw/special/20160206pga.asp) |
| Housing Market                           | Taiwan Alll Region Real Estate Tranzaction Dataset      | [Website of Ministry of the Interior, R.O.C. (Taiwan)](https://plvr.land.moi.gov.tw/Index)    |
| Education Level                          | 2016 Education Level of Taiwanese Population            | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Average Income                           | 2016 Income Tax of Southern Taiwan City                 | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Population                               | 2016 Demographics of Southern Taiwan City               | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Medical Resources                        | Number of Medical Clincs in Townships and Towns in 2016 | [Website of Ministry of Health and Welfare](https://dep.mohw.gov.tw/DOS/mp-113.html)          |
| Taiwan Map                               | Boundary of Townships, Towns, and Districts             | [DATA.GOV.TW](https://data.gov.tw/dataset/7441)                                               |

In housing market data, we choose to use ‘ping’ as a unit since it is the most commonly used measurement for calculating the area of a house in Taiwan. In addition, the housing market can be evaluated from two aspects: 1. Housing price 2. Housing trade. Later, we are going to see if the 0206 Earthquake caused a similar impact in two aspects to see if unexpected events like earthquakes can affect the southern Taiwan housing market.

We calculated the datasets above and cleaned them into the following columns:
| Factors                                  |Years                     |Column names                                 |
|------------------------------------------|--------------------------|---------------------------------------------|
| Seismic Intensity of the 0206 Earthquake | 2016                     | Magnitude_level                             |
| Housing Market                           | 2015                     | Original_Avg_House_Price_per_Ping_2015      |
|                                          |                          | number_of_house_trade_2015                  |
|                                          | 2016                     | Original_Avg_House_Price_per_Ping_2016      |
|                                          |                          | number_of_house_trade_2016                  |
|                                          | 2017                     | Original_Avg_House_Price_per_Ping_2017      |
|                                          |                          | number_of_house_trade_2017                  |
|                                          | 2015 to 2017             | gap_Original_Avg_House_Price_per_Ping_15_17 |
|                                          |                          | gap_number_of_house_trade_15_17             |
|                                          | 2016 to 2017             | gap_Original_Avg_House_Price_per_Ping_16_17 |
|                                          |                          | gap_number_of_house_trade_16_17             |
| Education Level                          | 2016                     | Proportion_Dr_Ma_Uni_Pop                    |
| Average Income                           | 2016                     | Ave_Income                                  |
| Population                               | 2016                     | Totalpop                                    |
| Medical Resources                        | 2016                     | Medi_Service_per                            |

Meaning of each column (all data are district data):

| Column names                                | Meaning                                                               |
|---------------------------------------------|-----------------------------------------------------------------------|
| Magnitude_level                             | The 0206 Earthquake intensity detected                                |
| Original_Avg_House_Price_per_Ping_2015      | Average housing price per ping in 2015                                |
| number_of_house_trade_2015                  | Number of housing trade in 2015                                       |
| Original_Avg_House_Price_per_Ping_2016      | Average housing price per ping in 2016                                |
| number_of_house_trade_2016                  | Number of housing trade in 2016                                       |
| Original_Avg_House_Price_per_Ping_2017      | Average housing price per ping in 2017                                |
| number_of_house_trade_2017                  | Number of housing trade in 2017                                       |
| gap_Original_Avg_House_Price_per_Ping_15_17 | Housing price in 2017 – housing price in 2015                         |
| gap_number_of_house_trade_15_17             | Housing trade in 2017 – housing trade in 2015                         |
| gap_Original_Avg_House_Price_per_Ping_16_17 | Housing price in 2017 – housing price in 2016                         |
| gap_number_of_house_trade_16_17             | Housing trade in 2017 – housing trade in 2016                         |
| Proportion_Dr_Ma_Uni_Pop                    | The population proportion of doctor, master, and university graduates |
| Ave_Income                                  | Average total income                                                  |
| Totalpop                                    | Total population of each district                                     |
| Medi_Service_per                            | The amount of medical service provided for each person                |

After the data cleaning process, we created a dataset that combined all the columns we needed from the datasets listed above, and we called it final_data_1. In final_data_1, there are total of 42 columns, but some of them are for future development, so the table above only list the column that we use to get our result.

## File Structure

```
📦 Week3_eg_House
├─ Raw Data
│  ├─ south_earthquake_intensity.csv
town_list.csv
Population: 各縣市總人口2014-2018.csv
Medcial Service: 雲嘉嘉南高屏_鄉鎮區人口教育醫療程度.csv
│  ├─ Income Tax: 105年綜合所得稅所得總額申報統計_鄉鎮市區.csv
│  ├─ Educational Level: 105年行政區15歲以上人口教育程度統計_鄉鎮市區.csv
│  ├─ Taiwan Map Folder: 鄉鎮市區界線1120928
│  │  ├─ Town_Majia_Sanhe.CPG
│  │  ├─ Town_Majia_Sanhe.dbf
│  │  ├─ Town_Majia_Sanhe.prj
│  │  ├─ Town_Majia_Sanhe.sbn
│  │  ├─ Town_Majia_Sanhe.sbx
│  │  ├─ Town_Majia_Sanhe.shp
│  │  ├─ Town_Majia_Sanhe.shp.xml
│  │  ├─ Town_Majia_Sanhe.shx
│  │  ├─ TOWN_MOI_1120825.CPG
│  │  ├─ TOWN_MOI_1120825.dbf
│  │  ├─ TOWN_MOI_1120825.prj
│  │  ├─ TOWN_MOI_1120825.shp
│  │  ├─ TOWN_MOI_1120825.shp.xml
│  │  ├─ TOWN_MOI_1120825.shx
│  │  ├─ TW-07-301000100G-614001.gfs
│  │  ├─ TW-07-301000100G-614001.xml
│  │  └─ 112年9月行政區界線異動清單.pdf
│  └─ Housing Market in Southern Taiwan
│     ├─ Yunlin
│     │  ├─ P_lvr_land_A 雲林-2015-1.csv
│     │  ├─ P_lvr_land_A 雲林-2015-2.csv
│     │  ├─ P_lvr_land_A 雲林-2015-3.csv
│     │  ├─ P_lvr_land_A 雲林-2015-4.csv
│     │  ├─ P_lvr_land_A 雲林-2016-1.csv
│     │  ├─ P_lvr_land_A 雲林-2016-2.csv
│     │  ├─ P_lvr_land_A 雲林-2016-3.csv
│     │  ├─ P_lvr_land_A 雲林-2016-4.csv
│     │  ├─ P_lvr_land_A 雲林-2017-1.csv
│     │  ├─ P_lvr_land_A 雲林-2017-2.csv
│     │  ├─ P_lvr_land_A 雲林-2017-3.csv
│     │  └─ P_lvr_land_A 雲林-2017-4.csv
│     ├─ Chiayi City
│     │  ├─ I_lvr_land_A 嘉義市-2015-1.csv
│     │  ├─ I_lvr_land_A 嘉義市-2015-2.csv
│     │  ├─ I_lvr_land_A 嘉義市-2015-3.csv
│     │  ├─ I_lvr_land_A 嘉義市-2015-4.csv
│     │  ├─ I_lvr_land_A 嘉義市-2016-1.csv
│     │  ├─ I_lvr_land_A 嘉義市-2016-2.csv
│     │  ├─ I_lvr_land_A 嘉義市-2016-3.csv
│     │  ├─ I_lvr_land_A 嘉義市-2016-4.csv
│     │  ├─ I_lvr_land_A 嘉義市-2017-1.csv
│     │  ├─ I_lvr_land_A 嘉義市-2017-2.csv
│     │  ├─ I_lvr_land_A 嘉義市-2017-3.csv
│     │  └─ I_lvr_land_A 嘉義市-2017-4.csv
│     ├─ Chiayi
│     │  ├─ Q_lvr_land_A 嘉義縣-2015-1.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2015-2.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2015-3.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2015-4.csv
│     │  ├─ Q_lvr_land_嘉義縣-2016-1.csv
│     │  ├─ Q_lvr_land_嘉義縣-2016-2.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2016-3.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2016-4.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2017-1.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2017-2.csv
│     │  ├─ Q_lvr_land_A 嘉義縣-2017-3.csv
│     │  └─ Q_lvr_land_A 嘉義縣-2017-4.csv
│     ├─ Tainan
│     │  ├─ D_lvr_land_台南2015-1.csv
│     │  ├─ D_lvr_land_台南2015-2.csv
│     │  ├─ D_lvr_land_台南2015-3.csv
│     │  ├─ D_lvr_land_台南2015-4.csv
│     │  ├─ D_lvr_land_台南2016-1.csv
│     │  ├─ D_lvr_land_台南2016-2.csv
│     │  ├─ D_lvr_land_台南2016-3.csv
│     │  ├─ D_lvr_land_台南2016-4.csv
│     │  ├─ D_lvr_land_台南2017-1.csv
│     │  ├─ D_lvr_land_台南2017-2.csv
│     │  ├─ D_lvr_land_台南2017-3.csv
│     │  └─ D_lvr_land_台南2017-4.csv
│     ├─ Kaohsiung
│     │  ├─ E_lvr_land_A 高雄-2015-1.csv
│     │  ├─ E_lvr_land_A 高雄-2015-2.csv
│     │  ├─ E_lvr_land_A 高雄-2015-3.csv
│     │  ├─ E_lvr_land_A 高雄-2015-4.csv
│     │  ├─ E_lvr_land_ 高雄-2016-1.csv
│     │  ├─ E_lvr_land_ 高雄-2016-2.csv
E_lvr_land_A 高雄-2016-3.csv
E_lvr_land_A 高雄-2016-4.csv
│     │  ├─ E_lvr_land_A 高雄-2017-1.csv
│     │  ├─ E_lvr_land_A 高雄-2017-2.csv
│     │  ├─ E_lvr_land_A 高雄-2017-3.csv
│     │  └─ E_lvr_land_A 高雄-2017-4.csv
│     └─ Pingtung
│        ├─ T_lvr_land_A 屏東-2015-1.csv
│        ├─ T_lvr_land_A 屏東-2015-2.csv
│        ├─ T_lvr_land_A 屏東-2015-3.csv
│        ├─ T_lvr_land_A 屏東-2015-4.csv
│        ├─ T_lvr_land_A 屏東-2016-1.csv
│        ├─ T_lvr_land_A 屏東-2016-2.csv
T_lvr_land_A 屏東-2016-3.csv
T_lvr_land_A 屏東-2016-4.csv
│        ├─ T_lvr_land_A 屏東-2017-1.csv
│        ├─ T_lvr_land_A 屏東-2017-2.csv
│        ├─ T_lvr_land_A 屏東-2017-3.csv
│        └─ T_lvr_land_A 屏東-2017-4.csv
├─ Data Cleaning
│  ├─ 2015房價.R
│  ├─ 2016房價.R
│  └─ 2016房價.R
├─ Data Merging
│  ├─ 2015~2017房價.R
│  └─ final_data.R
└─ Data Visualization
   └─ TW_GIS.R
```
©generated by [Project Tree Generator](https://woochanleee.github.io/project-tree-generator)


## Analysis

To evaluate how the 2016 0206 Earthquake affected housing prices in southern Taiwan, we took Original_Avg_House_Price_per_Ping_2016 as the dependent variable of the 2016 housing price regression model to see if any factors correlate with it.

2016 housing price regression model:

| hp_2016_model\<-lm(Original_Avg_House_Price_per_Ping_2016 \~  Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+  Totalpop + magnitude_level+Ave_Income, data=final_data_1)|
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Result of the 2016 housing price regression model:

<img width="581" alt="Screen Shot 2024-07-10 at 6 35 56 PM" src="https://github.com/maggiesleepy/ici_template/assets/174100098/7ad64309-3b94-42f4-8dbc-d25eaac4f01b">



From the result of the 2016 housing price regression model, we can discover that:

1.  **Medi_Service_per:**  
    The amount of medical service for each person in an area is statistically significant but has a negative impact on the 2016 housing prices. Indicating that the more sufficient medical resources an area provides, the housing prices in 2016 will decrease.

2.  **Proportion_Dr_Ma_Uni_Pop:**  
    The proportion of the population of doctor, master, and university graduates is statistically significant and has a positive impact on the 2016 housing prices.

3.  **Totalpop:**
    The total population is close to being statistically significant but has not yet reached the bar. And it has a positive impact on the 2016 housing prices

4.  **magnitude_level:**  
    The result shows that the 0206 Earthquake intensity is not correlated with the 2016 housing prices.

5.  **Adjusted R-squared:**  
    The adjusted R-squared of this model is 0.6541, which means that the dependent variable is yet to be fully explained. It shows that there is still room for improvement.

After seeing this result, we realized that we didn’t take lag periods into account, so we further conducted the 2016 housing price lagged regression model to see if the resulting adjusted R-squared would be better. We put in the housing price of 2015 as the lagged term.

2016 housing price lagged regression model:

| hp_2016_model_lag\<-lm(Original_Avg_House_Price_per_Ping_2016 \~  Original_Avg_House_Price_per_Ping_2015 + Medi_Service_per + Totalpop + Ave_Income + Proportion_Dr_Ma_Uni_Pop + magnitude_level, data=final_data_1) |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Result of 2016 housing price lagged regression model:

<img width="720" alt="Screen Shot 2024-07-10 at 6 32 50 PM" src="https://github.com/maggiesleepy/ici_template/assets/174100098/0c5f113b-5b1a-4823-bd7f-857baedf459d">



From the result of 2016 housing price lagged regression model, we can discover that:

1.  **Original_Avg_House_Price_per_Ping_2015:**  
    The result shows the housing price in 2015 is statistically significant and has a positive impact on the 2016 housing prices. This means that if the housing price in 2015 is high, the housing price of 2016 will also go high.

2.  **magnitude_level:**  
    After adding a lagged term, the intensity of the 0206 Earthquake becomes statistically significant and has a negative correlation to the housing price of 2016. This result aligns with our hypothesis.

3.  **Adjusted R-squared:**  
    We can discover that the adjusted R-squared increases from 0.6541 to 0.8698, which means the lagged term is an important variable that were missing in the last model.

We can conclude that a lagged term is very significant while evaluating the housing price since housing price is technically a time series data. Adding this term gives us a more accurate result, but because we didn’t come up with this idea until the later period of the project, we can only examine one lagged term. If we can add a few more lagged terms, we may get a result that is closer to reality.

After discussing how the 0206 Earthquake impacted the housing price in southern Taiwan, we could further examine if the same situation would happen in the housing trade, too. As a result, we choose number_of_house_trade_2016 as the dependent variable of the 2016 housing trade regression model.

2016 housing trade regression model:

| ht_2016_model\<-lm(number_of_house_trade_2016 \~  Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+  Totalpop + magnitude_level+Ave_Income, data=final_data_1)  |
|------------------------------------------------------------------------------------------------------------------------------------------------------------|

Result of the 2016 housing trade regression model:

<img width="623" alt="Screen Shot 2024-07-10 at 8 07 57 PM" src="https://github.com/maggiesleepy/ici_template/assets/174100098/06420cd4-93d0-457f-9997-ff605c7124cd">



From the result of the 2016 housing trade regression model, we can discover that:

1.  **Totalpop:**  
    The total population is statistically significant and has a positive impact on the 2016 housing trade, which means that as the population grows, the housing trade also become more prosperous.

2.  **Magnitude_level:**  
    The intensity of the 0206 Earthquake has a negative coefficient but the result shows that it does not have a correlation with the 2016 housing trade.

3.  **Adjusted R-squared:**  
    The adjusted R-squared is 0.8691, which is much higher than the 2016 housing price model. However, it still shows that there is room to improve this model.

2016 housing trade lagged regression model:

| ht_2016_model_lag\<-lm(number_of_house_trade_2016 \~  number_of_house_trade_2015+Medi_Service_per + Proportion_Dr_Ma_Uni_Pop+  Totalpop + magnitude_level+Ave_Income, data=final_data_1)  |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Result of the 2016 housing trade lagged regression model:

<img width="675" alt="Screen Shot 2024-07-10 at 8 17 33 PM" src="https://github.com/maggiesleepy/ici_template/assets/174100098/a8b01f06-fc79-4851-91c2-a721f407e950">



From the result of the 2016 housing trade lagged regression model, we can discover that:

1.  **number_of_house_trade_2015:**  
    This shows statistical significance and a positive impact on the 2016 housing trade. This means that, like the 2016 housing price, the 2016 housing trade is also highly affected by its lagged term.

2.  **Proportion_Dr_Ma_Uni_Pop:**  
    This explanatory variable is close to being statistically significant, and it has a positive effect on the 2016 housing trade.

3.  **Totalpop:**  
    The total population is statistically significant, and its coefficient shows that as the area has more population, the 2016 housing trade will increase.

4.  **magnitude_level:**  
    The intensity of the 0206 Earthquake is close to being statistically significant, and it harms the 2016 housing trade. This indicates that if an area has a higher intensity, the 2016 housing trade in this area tends to drop.

5.  **Ave_Income:**  
    The average total income is also close to being statistically significant and hurts the 2016 housing trade. This result may imply that in the wealthier areas, people tend to postpone their house trading, so the 2016 housing trade drops as the average income of an area increases.

6.  **Adjusted R-squared:**  
    The adjusted R-squared of this model is 0.9657. This means that the lagged term helps improve the explanatory power of the regression model.

These two housing trade regression models show that the 0206 Earthquake is not correlated with the 2016 housing trade, which is not the same as the situation of the 2016 housing price models. This result shows that the 0206 Earthquake intensity was not the main reason that impacted the 2016 housing trade.

## Results

In conclusion, the intensity that the 0206 Earthquake caused in each district in southern Taiwan is correlated to the 2016 housing price and nearly correlated to the 2016 housing trade. Both aspects of the southern Taiwan housing market evaluation demonstrate that the 2016 housing market is influenced by the lagged terms more than the intensity of the 0206 Earthquake. Even though the intensity of the 0206 Earthquake did not have a major impact on the housing market in southern Taiwan, we cannot overlook that this event did affect the housing market in 2016. Because the four regression models conducted are not yet perfect. In fact, there are many limitations to the project. For example, some districts lack data on house trading. Also, since Taiwan is a small island, we only have 148 districts in our datasets which may cause bias when we evaluate the reality.

The future development of this project could further delve into finding the factors that help increase the adjusted R-squared. For instance, adding more lagged terms or coming up with a brand new factor to control the model. Other than adjusting the model to be more accurate, we can also investigate if the 0206 Earthquake impacts the market of other properties like land or stock.

## Contributors

Maggie: responsible for the data cleaning process of the 40 columns, analyzing the result of regression models, and the writer of this paper

Yvonne: responsible for the data cleaning process of the 2 columns: Totalpop and Medi_Service_per

## Acknowledgments

For a person who is not familiar with data analysis, I cannot finish this research without the help of Prof. Pien Chung-Pe. Thank you for advising me through the whole semester and providing help when I was confused during the process.

## References

Dara Sources:
| Names of Datasets                                       | Resources Platform                                                                            |
|---------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Meinong Earthquake Seismic Intensity Table              | [Website of Central Weather Administration](https://scweb.cwa.gov.tw/special/20160206pga.asp) |
| Taiwan Alll Region Real Estate Tranzaction Dataset      | [Website of Ministry of the Interior, R.O.C. (Taiwan)](https://plvr.land.moi.gov.tw/Index)    |
| 2016 Education Level of Taiwanese Population            | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| 2016 Income Tax of Southern Taiwan City                 | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| 2016 Demographics of Southern Taiwan City               | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Number of Medical Clincs in Townships and Towns in 2016 | [Website of Ministry of Health and Welfare](https://dep.mohw.gov.tw/DOS/mp-113.html)          |
| Boundary of Townships, Towns, and Districts             | [DATA.GOV.TW](https://data.gov.tw/dataset/7441)                                               |
