# Project Title

The Influence of the June 2nd, 2016 Meinong Earthquake on the housing market in southern Taiwan

## Project Description

On April 3, 2024, a powerful earthquake with a magnitude of 7.2 struck eastern Taiwan in the Pacific Ocean. This earthquake is the strongest since the 0921 Earthquake, which had a magnitude of 7.3 and occurred in 1999.

A comparison between the two earthquakes reveals a significant decrease in casualties and damage caused by the 0403 Earthquake compared to the 0921 Earthquake. Notably, the number of houses damaged by the 0403 Earthquake is considerably lower than in the 921 event.

Given this reduction in damage, we are interested in exploring whether unexpected earthquakes could impact Taiwan's long-rising housing market. However, since the 0403 Earthquake is a recent event, the necessary data for evaluation is not yet available.

Therefore, we have chosen to examine the impact of another significant earthquake, the 0206 Meinong Earthquake in 2016. This earthquake has a magnitude of 6.4, and most of the damages occurred in the southern Taiwan counties. By analyzing the effects of the Meinong Earthquake on the housing market in southern Taiwan, we aim to gain insights into how a major earthquake event can influence housing market trends.


## Getting Started

In this project, we want to see if the 2016 0206 Earthquake influenced the southern Taiwan housing market, so we focus on dealing with the data from 2015 to 2017 in southern Taiwan counties.

List of counties we focus on researching:

| Yunlin | Chiayi City | Chiayi   |
|--------|-------------|----------|
| Tainan | Kaohsiung   | Pingtung |

To examine the influence, we have considered several factors: seismic intensity of the 0206 earthquake, data of housing market, education level, average income, population, and medical resources in southern Taiwan.

We acquired data on all the factors from the following platforms:

| Factors                                  | Names of Datasets                                       | Resources Platform                                                                            |
|------------------------------------------|---------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Seismic Intensity of The 0206 Earthquake | Meinong Earthquake Seismic Intensity Table              | [Website of Central Weather Administration](https://scweb.cwa.gov.tw/special/20160206pga.asp) |
| Housing Market                           | Taiwan Alll Region Real Estate Tranzaction Dataset      | [Website of Ministry of the Interior, R.O.C. (Taiwan)](https://plvr.land.moi.gov.tw/Index)    |
| Education Level                          | 2016 Education Level of Taiwanese Population            | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Average Income                           | 2016 Income Tax of southern Taiwan city                 | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Population                               | 2016 Demographics of southern Taiwan city               | [SEGIS](https://segis.moi.gov.tw/STATCloud/Index)                                             |
| Medical Resources                        | Number of Medical Clincs in Townships and Towns in 2016 | [Website of Ministry of Health and Welfare](https://dep.mohw.gov.tw/DOS/mp-113.html)          |

To process all the datasets above, install RStudio first and make sure the R version is 4.2.3. Open RStudio and install the following libraries that we will later use in the data cleaning process first.

Library list:

| dplyr | stringr | readxl | readr |
|-------|---------|--------|-------|

After the data cleaning process, we created a dataset that combined all the columns we needed from the datasets listed above, and we called it final_data_1. In final_data_1, there are total of 43 columns, but some of them are for future development, so the table below only list the column that we use to get our result.


We calculated the datasets above and cleaned them into the following columns:

| Factors                                  | Column names             |                                             |
|------------------------------------------|--------------------------|---------------------------------------------|
| Seismic Intensity of the 0206 Earthquake | Magnitude_level          |                                             |
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
| Education Level                          | Proportion_Dr_Ma_Uni_Pop |                                             |
| Average Income                           | Ave_Income               |                                             |
| Population                               | Totalpop                 |                                             |
| Medical Resources                        | Medi_Service_per         |                                             |

## File Structure

[Describe the file structure of your project, including how the files are organized and what each file contains. Be sure to explain the purpose of each file and how they are related to one another.]
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

[Describe your analysis methods and include any visualizations or graphics that you used to present your findings. Explain the insights that you gained from your analysis and how they relate to your research question or problem statement.]

## Results

[Provide a summary of your findings and conclusions, including any recommendations or implications for future research. Be sure to explain how your results address your research question or problem statement.]

## Contributors

[List the contributors to your project and describe their roles and responsibilities.]

## Acknowledgments

[Thank any individuals or organizations who provided support or assistance during your project, including funding sources or data providers.]

## References

[List any references or resources that you used during your project, including data sources, analytical methods, and tools.]
